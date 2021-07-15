# I had to use Start-Process to make sure ProduKey finishes before Get-Content tries to read the file.
# /nosavereg - Load ProduKey without saving settings to the Registry.
# /IEKeys 0  - Don't retrieve Internet Explorer keys.
# /sjson     - Save the output as a JSON file.
Start-Process -Wait -FilePath '.\ProduKey.exe' -ArgumentList '/nosavereg /IEKeys 0 /sjson Results.json'

Foreach ( $Result in (Get-Content -Path '.\Results.json' | ConvertFrom-Json) ) {

    # Cast to [DateTime] so it behaves properly in Inventory.
    # I used -as because it keeps [DateTime] from throwing an error on null values.
    # Fun fact: this line throws an error when using ForEach-Object, but not Foreach. I don't know why.
    $Result.'Modified Time' = $Result.'Modified Time' -as [DateTime]

    # ConvertFrom-Json outputs PSCustomObjects, so there's nothing else to do. Yay!
    $Result

}