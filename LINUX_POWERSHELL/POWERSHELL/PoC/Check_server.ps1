$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$computers = $json.menu.Computer_names
Foreach($c in $computers) {
IF (Test-Connection -BufferSize 32 -Count 1 -ComputerName $c -Quiet) {
        Write-Host "The remote computer " $c " is Online"
} Else {
        Write-Host "The remote computer " $c " is Offline"
}}