# This PoC will TransferFile from One Folder to Another Folder
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$FromFile = $json.menu.FromFile
$ToFile = $json.menu.ToFile
Move-Item -Path ($FromFile) -Destination ($ToFile)
