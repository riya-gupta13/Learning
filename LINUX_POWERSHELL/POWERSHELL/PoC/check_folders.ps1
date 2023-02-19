$json = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw | Out-String | ConvertFrom-Json
$MasterFolder = $json.menu.MasterFolder
$folders = Get-ChildItem $MasterFolder -Directory
foreach($subfolder in $folders)
{
    $file = $MasterFolder+'\'+$subfolder+'\NewFile.txt'
    write-host $file
    if([System.IO.File]::Exists($file))
    {
        write-host True
    }
    else
    {
        write-host "False"
    }
}

