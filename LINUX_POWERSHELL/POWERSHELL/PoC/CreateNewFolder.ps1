# This PoC will Create New Folder
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$FromFile = $json.menu.FromFile
$ToFile = $json.menu.ToFile
Move-Item -Path ($FromFile) -Destination ($ToFile)
