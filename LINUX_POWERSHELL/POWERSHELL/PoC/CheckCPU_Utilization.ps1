# This PoC will Start a given Service
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$ServiceNameToStop = $json.menu.ServiceNameToStop
$CPU_Utilization = Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average
Write-Host "CPU Utilization is: " + $CPU_Utilization
