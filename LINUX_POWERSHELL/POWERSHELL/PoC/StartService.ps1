# This PoC will Start a given Service
$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$ServiceNameToStop = $json.menu.ServiceNameToStop
try {
    Start-Service -Name $ServiceNameToStop
    if(!$?){
        Write-Host "Admin Rights required within for this Command"
    } else {
        Write-Host "Command executed Successfully"
    }
}
catch {
    Write-Host "Admin Rights required"
}
finally {
    Write-Host "Admin Rights required in Finally"
}
