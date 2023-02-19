# This PoC will TransferFolder from One Folder to Another Folder
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$CreateFolder = $json.menu.CreateFolder
Move-Item -Path ($FromFolder) -Destination ($ToFolder)
