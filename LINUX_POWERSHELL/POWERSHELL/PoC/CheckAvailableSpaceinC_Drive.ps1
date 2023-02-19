# This PoC will Start a given Service
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$ServiceNameToStop = $json.menu.ServiceNameToStop
$VolumeInC_Drive = Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }}
Write-Host "Available Space in C Drive is: " + $VolumeInC_Drive
