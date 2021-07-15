# Disable progress bars.
$ProgressPreference = 'SilentlyContinue'

# Save the current path.
$OriginalPath = $PWD

# Make sure the current path is the same as this script.
Set-Location (Split-Path $MyInvocation.MyCommand.Source)

Remove-Item -Path '.\ProduKey.exe' -ErrorAction 'SilentlyContinue'

[System.Net.WebClient]::new().DownloadFile('https://www.nirsoft.net/utils/produkey.zip', "$PWD\produkey.zip")

Expand-Archive -Path '.\produkey.zip' -DestinationPath .

Remove-Item -Path '.\produkey.zip', '.\ProduKey.chm', '.\readme.txt'

# Restore the original path.
Set-Location $OriginalPath