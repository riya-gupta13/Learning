# This PoC will read the data from the JSON File and display their Output on the Command Window
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
Write-Host $json.menu.header
Write-Host $json.menu.FromFolder
Write-Host $json.menu.ToFolder
Write-Host $json.menu.items.id.Contains("Open")
Write-Host $json.menu.items.Count
$ItemCount = $json.menu.items.Count
For ($i = 0; $i -lt $ItemCount; $i++) {
    Write-Host $json.menu.items.Get($i)
}
