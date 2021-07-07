[CmdletBinding()]
param(
	# Define the maximum number of runspaces. Default value is the number of processor son the machine + 1
	[int]$MaxRunspaces = ( [int]$env:NUMBER_OF_PROCESSORS * 25),

	# skip NBTStat -A on each entry
	[Switch]$SkipNbtName,

	# skip reverse lookup of each neighbor IP
	[Switch]$SkipReverseLookup
)

# Grab the ARP cache and filter out broadcast and multicast
$neighbors = Get-NetNeighbor | Where-Object {
	($_.LinkLayerAddress -ne "") -and
	($_.LinkLayerAddress -ne "FF-FF-FF-FF-FF-FF") -and # Broadcast
	($_.LinkLayerAddress -notlike "01-00-5E-*") -and # IPv4 multicast
	($_.LinkLayerAddress -notlike "33-33-*") } # IPV6 multicast

## create runspace pool with min =1 and max = $MaxRunspaces
$rp = [runspacefactory]::CreateRunspacePool(1,$MaxRunspaces)
$rp.Open()

$cmds = New-Object -TypeName System.Collections.ArrayList

$neighbors | ForEach-Object {
 ## create powershell and link to runspace pool
$psa = [powershell]::Create()
$psa.RunspacePool = $rp

# add the script
  [void]$psa.AddScript({
     param ($neighbor, [switch]$SkipNbtName, [switch]$SkipReverseLookup)
     
	if (-not $SkipReverseLookup) {

		# Check DNS for the hostname associated with this IP
		try {

			$DNSName = [System.Net.Dns]::GetHostEntry($neighbor.IPAddress).hostname

		} catch {

			Write-Verbose "Unable to resolve host $($neighbor.IPAddress)"

		}
	}

	if (-not $SkipNbtName) {

		# Runs nbtstat, matches the output to regex, then grabs the match at index 1
		$nbtstat = nbtstat -A $neighbor.IPAddress |
		Where-Object { $_ -match '^\s*([^<\s]+)\s*<00>\s*UNIQUE' } |
		ForEach-Object { $matches[1] }

	}

	# Grab standard properties
	$output = $neighbor | Select-Object IfIndex, InterfaceAlias, IPAddress, State, Store, LinkLayerAddress

	if (-not $SkipNbtName) {

		$output = $output | Select-Object *, @{ name = 'NetBiosName'; expression = { $nbtstat } }

	}

	if (-not $SkipReverseLookup) {

		$output = $output | Select-Object *, @{ name = 'ReverseLookup'; expression = { $DNSName } }

	}
	$output


   })

   # Add the Neighbor Parameter using the current item in the pipeline
   [void]$psa.AddParameter('Neighbor',$psitem)
   if($SkipNbtName) { [void]$psa.AddParameter('SkipNbtName',$true) }
   if($SkipReverseLookup) {[void]$psa.AddParameter('SkipReverseLookup',$true) }
   
   $handle = $psa.BeginInvoke()

   $temp = '' | Select-Object PowerShell, Handle
   $temp.PowerShell = $psa
   $temp.Handle = $handle

   [void]$cmds.Add($temp)
}

## retreive data
$cmds | ForEach-Object {$_.PowerShell.EndInvoke($_.Handle)}

## clean up
$cmds | ForEach-Object {$_.PowerShell.Dispose()}  
$rp.Close()
$rp.Dispose() 