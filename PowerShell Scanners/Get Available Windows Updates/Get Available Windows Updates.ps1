[CmdletBinding()]
Param(
    [switch]$WSUS
)
& '.\Install and Import Module.ps1' -ModuleName "PSWindowsUpdate"

# The Collection object this cmdlet emits is really weird.
# We have to assign it to a variable to get it to work properly in a pipeline.
If($WSUS){
    $GWU = Get-WindowsUpdate -WindowsUpdate
}Else{
    $GWU = Get-WindowsUpdate 
}

<#
Due to a bug in Inventory, we want this script to always emit an object, even if no updates were found.

When you set a variable equal to the output of a cmdlet and that cmdlet returns nothing, your variable
will contain an empty PSCustomObject.
ForEach-Object skips empty PSCustomObjects, but not objects that are truly empty (such as $null).
Clear-Variable sets a variable back to a truly empty object, which causes this script to emit the
PSCustomObject we build below with all of the values of its properties set to $null instead of skipping it.

Here's some code you can use to test this yourself:
$GWU = foreach ( $Thing in $null ) {}
$GWU.PSObject
$GWU | ForEach-Object { [PSCustomObject]@{ 'KB' = $_.KB } }

Clear-Variable 'GWU'
$GWU.PSObject
$GWU | ForEach-Object { [PSCustomObject]@{ 'KB' = $_.KB } }
#>
If ( $null -eq $GWU ) {

    Clear-Variable 'GWU'

}

$GWU | ForEach-Object {

    [PSCustomObject]@{
        "KB"                              = $_.KB
        "Title"                           = $_.Title
    
        # Convert to bytes so it will display properly in Inventory
        "Size"                            = [UInt64](Invoke-Expression $_.Size)

        "Status"                          = $_.Status
        "Description"                     = $_.Description
        "RebootRequired"                  = $_.RebootRequired
    
        # Indicates whether the update is flagged to be automatically selected by Windows Update.
        "AutoSelectOnWebSites"            = $_.AutoSelectOnWebSites

        "CanRequireSource"                = $_.CanRequireSource
        "Deadline"                        = $_.Deadline
        "DeltaCompressedContentAvailable" = $_.DeltaCompressedContentAvailable
        "DeltaCompressedContentPreferred" = $_.DeltaCompressedContentPreferred
        "EulaAccepted"                    = $_.EulaAccepted
        "IsBeta"                          = $_.IsBeta
        "IsDownloaded"                    = $_.IsDownloaded
        "IsHidden"                        = $_.IsHidden
        "IsInstalled"                     = $_.IsInstalled
        "IsMandatory"                     = $_.IsMandatory
        "IsPresent"                       = $_.IsPresent
        "IsUninstallable"                 = $_.IsUninstallable
        "UninstallationNotes"             = $_.UninstallationNotes
        "LastDeploymentChangeTime"        = $_.LastDeploymentChangeTime

        # Convert Decimal to 64-bit Integer
        "MaxDownloadSize"                 = [UInt64]$_.MaxDownloadSize
        "MinDownloadSize"                 = [UInt64]$_.MinDownloadSize

        "MsrcSeverity"                    = $_.MsrcSeverity
    
        # MHz
        "RecommendedCpuSpeed"             = $_.RecommendedCpuSpeed

        # https://docs.microsoft.com/en-us/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace
        "RecommendedHardDiskSpace"        = [UInt64]($_.RecommendedHardDiskSpace * 1MB)

        # https://docs.microsoft.com/en-us/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory
        "RecommendedMemorySize"           = [UInt64]($_.RecommendedMemory * 1MB)

        "ReleaseNotes"                    = $_.ReleaseNotes
        "SupportUrl"                      = $_.SupportUrl

        # https://docs.microsoft.com/en-us/windows/win32/api/wuapi/ne-wuapi-updatetype
        "Type"                            = switch ($_.Type) {
            1 { "Software" }
            2 { "Driver" }
            Default { "Unknown" } 
        }

        "DeploymentAction"                = $_.DeploymentAction
        "DownloadPriority"                = $_.DownloadPriority
    
        # Indicates whether an update can be discovered only by browsing through the available updates.
        "BrowseOnly"                      = $_.BrowseOnly

        "PerUser"                         = $_.PerUser
        "AutoSelection"                   = $_.AutoSelection
        "AutoDownload"                    = $_.AutoDownload
    }

}