[CmdletBinding()]
param (
    [String[]]$Browsers,
    [Switch]$EnablePermissions
)

$Template = @{
    'AppData'      = 'Local'
    'LastVersion'  = 'last_chrome_version'
    # 'Default*' is intentionally a wildcard to prevent errors if it is missing.
    # https://github.com/pdq/PowerShell-Scanners/pull/54#discussion_r626112183
    'ProfileNames' = 'Default*', 'Profile*'
    'Settings'     = 'settings'
}
$BrowserTable = @{
    'Brave'          = $Template.Clone()
    'Chromium'       = $Template.Clone()
    'Google Chrome'  = $Template.Clone()
    'Microsoft Edge' = $Template.Clone()
    # Opera, why do you have to be so different? :'(
    'Opera'          = @{
        'AppData'      = 'Roaming'
        'LastVersion'  = 'last_opera_version'
        'ProfileBase'  = 'Opera Software'
        'ProfileNames' = 'Opera*'
        'Settings'     = 'opsettings'
    }
    'Vivaldi'        = $Template.Clone()
}
$BrowserTable.Brave.ProfileBase = 'BraveSoftware\Brave-Browser\User Data'
$BrowserTable.Chromium.ProfileBase = 'Chromium\User Data'
$BrowserTable.'Google Chrome'.ProfileBase = 'Google\Chrome\User Data'
$BrowserTable.'Microsoft Edge'.ProfileBase = 'Microsoft\Edge\User Data'
$BrowserTable.Vivaldi.ProfileBase = 'Vivaldi\User Data'


# Set up or check the list of browsers to scan.
if ( -not $Browsers ) {

    $Browsers = $BrowserTable.Keys

} else {

    Foreach ( $BrowserName in $Browsers ) {

        if ( $BrowserName -notin $BrowserTable.Keys ) {

            throw "'$BrowserName' does not match any entries in the list of supported browsers."

        }

    }

}

# Set up the JSON parser for the Preferences files below.
# This .NET method is necessary because ConvertFrom-Json can't handle duplicate entries with different cases.
# https://github.com/pdq/PowerShell-Scanners/issues/23
Add-Type -AssemblyName System.Web.Extensions
$JsonParser = New-Object -TypeName System.Web.Script.Serialization.JavaScriptSerializer

Foreach ( $User in (Get-ChildItem -Directory -Path "$env:SystemDrive\Users") ) {

    Foreach ( $BrowserName in $Browsers ) {

        $Browser = $BrowserTable.$BrowserName
    
        # Get profiles.
        $ProfileBase = "$($User.FullName)\AppData\$($Browser.AppData)\$($Browser.ProfileBase)"
        if ( Test-Path $ProfileBase ) {

            Set-Location -Path $ProfileBase

        } else {

            # Browser is not installed, or the user has never opened it.
            Continue

        }
        $Profiles = Get-Item -Path $Browser.ProfileNames

        Foreach ( $Profile in $Profiles ) {
        
            $SecurePreferencesFile = "$($Profile.FullName)\Secure Preferences"
            if ( Test-Path $SecurePreferencesFile ) {

                # Secure Preferences contains the vast majority of the information we want.
                $SecurePreferencesText = Get-Content $SecurePreferencesFile
                $SecurePreferencesJson = $JsonParser.DeserializeObject($SecurePreferencesText)
                
                # Make sure extension data is present.
                if ( -not $SecurePreferencesJson.extensions."$($Browser.Settings)" ) {

                    Write-Verbose "Unable to find the extensions.$($Browser.Settings) node in: $SecurePreferencesFile"
                    Continue

                }

            } else {

                Write-Verbose "Unable to find a 'Secure Preferences' file in: $($Profile.FullName)"
                Continue

            }

            $PreferencesFile = "$($Profile.FullName)\Preferences"
            $PreferencesJson = $null
            if ( Test-Path $PreferencesFile ) {

                # The only thing we care about in Preferences is the last browser version.
                $PreferencesText = Get-Content $PreferencesFile
                $PreferencesJson = $JsonParser.DeserializeObject($PreferencesText)

            } else {

                Write-Verbose "Unable to find a 'Preferences' file in: $($Profile.FullName)"
                # It doesn't matter if this one is missing, so no need to skip.

            }

            Foreach ( $Extension in $SecurePreferencesJson.extensions."$($Browser.Settings)".GetEnumerator() ) {

                $ID = $Extension.Key
                $Extension = $Extension.Value
                $Name = $Extension.manifest.name

                # Ignore blank names.
                if ( -Not $Name ) {

                    Write-Verbose "Blank name for ID '$ID' in: $SecurePreferencesFile"
                    Continue

                }

                # Convert install_time from Webkit format.
                $InstallTime = [Double]$Extension.install_time
                # Divide by 1,000,000 because we are going to add seconds on to the base date.
                $InstallTime = ($InstallTime - 11644473600000000) / 1000000
                $UtcTime = Get-Date -Date '1970-01-01 00:00:00'
                $UtcTime = $UtcTime.AddSeconds($InstallTime)
                $InstallDate = [System.TimeZoneInfo]::ConvertTimeFromUtc($UtcTime, (Get-TimeZone))

                $Output = [Ordered]@{
                    'Browser'           = [String]  $BrowserName
                    'Name'              = [String]  $Name
                    'Enabled'           = [Bool]    $Extension.state
                    'Description'       = [String]  $Extension.manifest.description
                    'Extension Version' = [String]  $Extension.manifest.version
                    'Browser Version'   = [String]  $PreferencesJson.extensions."$($Browser.LastVersion)"
                    'Default Install'   = [Bool]    $Extension.was_installed_by_default
                    'OEM Install'       = [Bool]    $Extension.was_installed_by_oem
                    'ID'                = [String]  $ID
                    'Install Date'      = [DateTime]$InstallDate
                    'User'              = [String]  $User.Name
                    'Profile'           = [String]  $Profile.Name
                }

                if ( $EnablePermissions ) {

                    # Convert Permissions array into a multi-line string.
                    # This multi-line string is kind of ugly in Inventory, so it's disabled by default.
                    $Output.Permissions = [String]($Extension.manifest.permissions -Join "`n")

                }

                [PSCustomObject]$Output
            
            }

        }

    }

}