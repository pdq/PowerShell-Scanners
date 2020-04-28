[cmdletBinding()]
param(<#reserved for future use#>)

begin {
    try {
        Get-Command choco -ErrorAction Stop 
    } catch {
        throw "choco not installed, or not found on PATH."
    }
}

process {

    function ConvertTo-ChocoObject {
        <#
            .SYNOPSIS
            Converts the output from choco into a pscustomobject
            
            .PARAMETER InputObject
            The pipeline input to process
            
            .PARAMETER Audit
            If you want more detailed information, pass this to get extra audit details

            .EXAMPLE
            choco list -lo -r | ConvertTo-ChocoObject

            .EXAMPLE
            choco list -lo -r --audit | ConnvertTo-ChocoObject -Audit
            #>
        [CmdletBinding()]
        Param (
            [Parameter(ValueFromPipeline)]
            [string]
            $InputObject,
    
            [Parameter()]
            [switch]
            $Audit
        )
    
        Process {
            if (-not [string]::IsNullOrEmpty($InputObject)) {
                
                $props = $_.split('|')
                
                $hash = @{
                name = $props[0]
                version = $props[1]
                }

                if($Audit){
                    #The following get picked up with using the --audit flag in C4B.
                    $AuditHash = @{    
                        InstalledBy = $props[2] -replace ('User:','')
                        Domain = $props[3] -replace ('Domain:','')
                        RequestedBy = $props[4] -replace ('Original User:','')
                        'InstallDate(UTC)' = $props[5] -replace ('InstallDateUtc:','')   
                    }

                    $hash = $hash + $AuditHash
                    
                }
                [pscustomobject]$hash
            }
        }
    }

    if((Test-Path C:\ProgramData\chocolatey\license)){
        $packages = choco list -lo --audit -r
        $packages | ConvertTo-ChocoObject  -Audit
    } else {
        $packages = choco list -lo -r
        $packages | ConvertTo-ChocoObject
    }

}
