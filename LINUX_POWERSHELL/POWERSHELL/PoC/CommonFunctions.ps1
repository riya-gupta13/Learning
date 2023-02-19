function GetRandomValue {
    $L_RandomValue = ""
    $L_RandomValue = Get-Random -Minimum 100 -Maximum 10000
    return "$L_RandomValue".PadLeft(4,"0")
}

function WriteLog($ScriptName,$LineNumber,$LogType,$LogString)
{
    $LogFile = "$PSScriptRoot\$(gc env:computername).log"
    $ErrFile = "$PSScriptRoot\$(gc env:computername).err"
    $DateTime = "[{0:yyyy/MM/dd} {0:HH:mm:ss.fffff}]" -f (Get-Date)
    $LogMessage = "$(__HOSTNAME__) $(__USERNAME__) $Datetime '$ScriptName' $LineNumber $LogType $LogString"
    Add-content $LogFile -value $LogMessage
    If ($LogType -eq "E") {
        Add-content $ErrFile -value $LogMessage
    }
}

function GetFuncTemplate {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [PSCustomObject] $P_menu,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Name
    )
    Begin{
        $L_Param = ""
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
        Return L_Param
    }
}

function FormatError {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_Error
    )
    Begin{
        $L_ErrMessage = ""
        $L_ErrBackTrace = ""
    }
    Process{
        $L_ErrMessage = $P_Error.Exception.Message
        $L_ErrBackTrace = $P_Error.ScriptStackTrace
    }
    end{
        return $L_ErrMessage + " " + $L_ErrBackTrace
    }
}


function GetJsonObject(){
    [CmdletBinding()]
    Param()
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode +" Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
        [PSCustomObject] $L_JsonObj 
    }
    Process {
        try {
            $L_JsonObj = Get-Content -Path ($PSScriptRoot + '\Config.json') -Raw -ErrorAction Stop | Out-String | ConvertFrom-Json 
        } 
        catch {            
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_LOAD_JSON__ + " " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end {
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
        return $L_JsonObj   
    }
}

function GetJsonParamValue {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [PSCustomObject] $menu,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Name
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
        $ParamNameExists = "False"
        $ParamValue = ''
    }
    Process{
        if(Get-Member -inputobject $menu -name $P_Name -Membertype Properties){
                $ParamNameExists = "Yes"
                $ParamValue = $menu.$P_Name
         } else{
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_READ_JSON_PARAM__ + " " + " Parameter: " + $P_Name + " does not exist.")
                $ParamNameExists = "No"
                $ParamValue = ''
         }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $ParamNameExists + " " + $ParamValue)
        return $ParamNameExists,$ParamValue
    }
}

function TestJson(){
    $obj = GetJsonObject
    $P_exists,$P_val = GetJsonParamValue -menu $obj.menu.menu2.menu_2_1 -P_Name "menu3"
    write-host $P_exists $P_val
}

function CheckAdminRights {
    [CmdletBinding()]
    Param()
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
        $L_AdminRight = $false
        $L_PrincipalObject
        $L_CurrentUserID
    }
    Process{
        $L_CurrentUserID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $L_PrincipalObject = New-Object System.Security.Principal.WindowsPrincipal($L_CurrentUserID)
        if ($L_PrincipalObject.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
            WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + "Admin Rights are there")            
            $L_AdminRight = $true
        } else {
            $L_AdminRight = $false
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_NO_ADMIN_RIGHTS__)
            WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + "Admin Rights are not there")            
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_AdminRight)
        return $L_AdminRight
    }
}

function GetServiceDetailsByName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JsonServiceName
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
        $L_Service = ""
    }
    Process{
        try {
            $L_Service = Get-Service -Name $P_JsonServiceName -ErrorAction Stop
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_Service)
        return $L_Service
    }
}

function GetServiceDetailsByDisplayName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JsonServiceName
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
        $L_Service = ""
    }
    Process{
        $L_Service = Get-Service -DisplayName $P_JsonServiceName
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_Service)
        return $L_Service
    }
}


function StopService_ByName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JSONServiceParamName,
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_AdminRightsRequired
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values)
        $L_ServiceName = ""
        $L_Service = ""
    }
    Process{
        $obj = GetJsonObject
        $L_exists, $L_ServiceName = GetJsonParamValue -menu $obj.menu -P_Name $P_JSONServiceParamName
        Write-Host $L_exists $L_ServiceName
        if (($L_exists -eq "Yes") -AND ([bool]$L_ServiceName) -AND ($P_AdminRightsRequired -eq 'Yes' -AND (CheckAdminRights) -OR ($P_AdminRightsRequired -eq 'No') ) ) {
            try {
                $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -ne "Running") {
                    Write-Host "Service is Not Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is not running and can not be stopped")            
                } else {
                    Write-Host "Service is Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is running and program will try to stop it")            
                }
                Stop-Service -Name $L_ServiceName -ErrorAction Stop
                $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -ne "Stopped") {
                    WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + "Unable to stop Service " + $L_ServiceName)
                } else {
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " stopped successfully")
                }
            }
            catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_STOP_SERVICE__ + " " + (FormatError -P_Error $_))
                Write-Host $_.ScriptStackTrace
            }            
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
    }
}


function StopService_ByDisplayName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JSONServiceParamName,
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_AdminRightsRequired
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values)
        $L_ServiceName = ""
        $L_Service = ""
    }
    Process{
        $obj = GetJsonObject
        $L_exists, $L_ServiceName = GetJsonParamValue -menu $obj.menu -P_Name $P_JSONServiceParamName
        Write-Host $L_exists $L_ServiceName
        if (($L_exists -eq "Yes") -AND ([bool]$L_ServiceName) -AND ($P_AdminRightsRequired -eq 'Yes' -AND (CheckAdminRights) -OR ($P_AdminRightsRequired -eq 'No') ) ) {
            try {
                $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -ne "Running") {
                    Write-Host "Service is Not Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is not running and can not be stopped")            
                } else {
                    Write-Host "Service is Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is running and program will try to stop it")            
                }
                Stop-Service -Na $L_ServiceName -ErrorAction Stop
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " stopped successfully")            
            }
            catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_STOP_SERVICE__ + " " + (FormatError -P_Error $_))
                Write-Host $_.ScriptStackTrace
            }            
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
    }
}

function StartService_ByName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JSONServiceParamName,
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_AdminRightsRequired
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values)
        $L_ServiceName = ""
        $L_Service = ""
    }
    Process{
        try {
            $obj = GetJsonObject
            $L_exists, $L_ServiceName = GetJsonParamValue -menu $obj.menu -P_Name $P_JSONServiceParamName -ErrorAction Stop
            Write-Host $L_exists $L_ServiceName
            if (($L_exists -eq "Yes") -AND ([bool]$L_ServiceName) -AND ($P_AdminRightsRequired -eq 'Yes' -AND (CheckAdminRights) -OR ($P_AdminRightsRequired -eq 'No') ) ) {
                $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -eq "Running") {
                    Write-Host "Service is Already Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is Already running and can not start it")            
                } else {
                    Write-Host "Service is Not running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is running and program will try to start it")            
                    Start-Service -Name $L_ServiceName -ErrorAction Stop
                    $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                    if ($L_Service.Status -ne "Running") {
                        WriteLog $(__FILE__) $(__LINE__) "E" ("Unable to start Service " + $L_ServiceName)
                    } else {
                        WriteLog $(__FILE__) $(__LINE__) "I" ("Service " + $L_ServiceName + " started successfully")
                    }
                }
            }
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_START_SERVICE__ + " " +  (FormatError -P_Error $_))
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $_.ScriptStackTrace)
        }            
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
    }
}

function StartService_ByDisplayName {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_JSONServiceParamName,
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_AdminRightsRequired
    )
    Begin{
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values)
        $L_ServiceName = ""
        $L_Service = ""
    }
    Process{
        $obj = GetJsonObject
        $L_exists, $L_ServiceName = GetJsonParamValue -menu $obj.menu -P_Name $P_JSONServiceParamName
        Write-Host $L_exists $L_ServiceName
        if (($L_exists -eq "Yes") -AND ([bool]$L_ServiceName) -AND ($P_AdminRightsRequired -eq 'Yes' -AND (CheckAdminRights) -OR ($P_AdminRightsRequired -eq 'No') ) ) {
            try {
                $L_Service = GetServiceDetailsByDisplayName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -eq "Running") {
                    Write-Host "Service is Already Running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is Already running and can not start it")            
                } else {
                    Write-Host "Service is Not running"
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " is running and program will try to start it")            
                }
                Start-Service -Name $L_ServiceName -ErrorAction Stop
                $L_Service = GetServiceDetailsByName -P_JsonServiceName $L_ServiceName
                if ($L_Service.Status -ne "Running") {
                    WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + "Unable to start Service " + $L_ServiceName)
                } else {
                    WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Service " + $L_ServiceName + " started successfully")
                }
            }
            catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_START_SERVICE__ + " " +   (FormatError -P_Error $_))
                Write-Host $_.ScriptStackTrace
            }            
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
    }
}

function GetAvailableDriveFreeSpaceInBytes {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $P_DRriveLetter
    )
    Begin{
        $L_DriveFreeSpace = 0
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            $L_DriveFreeSpace = Get-PSDrive $P_DRriveLetter | Select-Object Free
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_DriveFreeSpace)
        Return $L_DriveFreeSpace
    }
}

function CheckFolderExistsOrNot {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $P_FolderPath
    )
    Begin{
        $L_FolderExists = "No"
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            if([System.IO.File]::Exists($P_FolderPath)) {
                $L_FolderExists = "Yes"
            } else {
                $L_FolderExists = "No"
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + " Folder: " + $P_FolderPath + " does not exists " + $global:__ERR_FOLDER_NOT_EXISTS__)
            }
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_FolderExists)
        Return $L_FolderExists
    }
}


function GetFolderSizeInBytes {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $P_FolderPath
    )
    Begin{
        $L_FolderSize = 0
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            if ((CheckFolderExistsOrNot -P_FolderPath $P_FolderPath) -eq "Yes") {
                $L_FolderSize = Get-ChildItem $P_FolderPath | Measure-Object -Property Length -sum | Select-Object sum
            } else {
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + " Folder: " + $P_FolderPath + " does not exists to get Size " + $global:__ERR_FOLDER_SIZE__)
            }
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_FolderSize)
        Return $L_FolderSize
    }
}

function SearchFileForRegEx {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_FilePath,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_RegExHashTable
    )
    Begin{
        $L_Param = ""        
        $L_RandomExeCode = (GetRandomValue)
        $L_Hashtable = $P_RegExHashTable
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            $L_File = get-item $P_FilePath
            $L_FileReader = New-Object System.IO.StreamReader -ArgumentList $L_File -ErrorAction Stop                        
            While ( ($Line = $L_FileReader.ReadLine()) -ne $null ) 
            {
                ForEach ($Thing in $L_Hashtable.Values)
                {
                    #Write-Host $Thing
                    If ($Thing.Pattern.IsMatch($Line))
                    {
                        #If ($ShowMatchedLines) { 
                        #    $Line; 
                        #    Write-Host "Matched line: " + $Line
                            #Break 
                        #}  #Break out of foreach, one match is sufficient.
                        #Write-Host "Matched line: " + $Line
                        $Thing.Counter++ 
                        #Write-Host "Counter: " + $Thing.Counter
                    }     
                    Else
                    {
                        #Write-Host "Invalid pattern line: " + $Line
                    }
                }
            }
            # Emit count of patterns that matched at least one line.
            #Custom object for the output; needed for both WinPosh and PoshCore compat.
            $Out = ''| Select-Object -Property Count,Description,Pattern  

            ForEach ($Thing in $L_Hashtable.Values)
            {
                #Write-Host "Counter in ForEach Loop: " + $Thing.Counter
                #if ($Thing.Counter -gt 0) 
                #{ 
                    $Out.Count = $Thing.Counter
                    $Out.Description = $Thing.Description
                    $Out.Pattern = $Thing.Pattern.ToString()
                    Write-Host $Out 
                #}
            }
            $L_FileReader.Close()
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host (FormatError -P_Error $_)
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
        #Return L_Param
    }
}

function CheckServerOnlineStatus {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $P_ServerName
    )
    Begin{
        $L_ServerStatus = "No"
        $L_RandomExeCode = (GetRandomValue)
        $L_StartTime = Get-Date
        $L_EndTime = ""
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            IF (Test-Connection -BufferSize 32 -Count 1 -ComputerName $P_ServerName -Quiet) {
                $L_ServerStatus = "Yes"
                $L_EndTime = Get-Date
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Server " + $P_ServerName + " is Online. Took " + ($($L_EndTime - $L_StartTime)) + " Seconds" )
            } else {
                $L_ServerStatus = "No"
                WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + $global:__ERR_LOAD_JSON__ + " Server: " + $P_ServerName + " is Offline")
            }     
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + ($($L_EndTime - $L_StartTime)) + " " + $L_ServerStatus)
        Return $L_ServerStatus
    }
}


function GetEventLogs {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_LogName, 
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_EntryType,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_BeginDate,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_EndDate, 
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Source
    )
    Begin{
        $L_Param = ""
        $L_EventLogData = ""
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            $L_EventLogData = Get-EventLog -LogName $P_LogName -EntryType $P_EntryType -After $P_BeginDate -Before $P_EndDate -Source $P_Source
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_EventLogData)
        Return $L_EventLogData
    }
}

function Send_Text_Email {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_From,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_To,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Subject,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Body,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_Priority,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [string] $P_SMTP_Server
    )
    Begin{
        $L_Success = "No"
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            Send-MailMessage -From $P_From -To $P_To -Subject $P_Subject -Body $P_Body -Priority $P_Priority -SmtpServer $P_SMTP_Server
            $L_Success = "Yes"
        }
        catch {
            $L_Success = "No"
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: ")
        Return $L_Success
    }
}


function RegisterFileChangeEvent {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [String] $P_FileName,
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [String] $P_Identifier
    )
    Begin{
        $L_Registered = "No"
        $L_Filter = "*.*" #all files
        $L_JobID = 0
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            if(Get-EventSubscriber | Where-Object -Property SourceIdentifier -eq $P_Identifier) {
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " JobID with Identifier: " + $P_Identifier + " already exists. Can not create another with the same Identifier name") 
                Exit
            } else {
                $L_watcher = New-Object IO.FileSystemWatcher "$P_FileName" -Property @{ 
                    #IncludeSubdirectories = $false
                    #EnableRaisingEvents = $true
                }
                $L_ChangeAction = [scriptblock]::Create('
                        # This is the code which will be executed every time a file change is detected
                        $L_Path = $Event.SourceEventArgs.FullPath
                        $L_FileName = $Event.SourceEventArgs.Name
                        $L_ChangeType = $Event.SourceEventArgs.ChangeType
                        $L_Timestamp = $Event.TimeGenerated
                        Write-Host "The file $L_FileName was $L_ChangeType at $L_Timestamp"
                    ')

                $L_Job = Register-ObjectEvent $L_Watcher -EventName "Changed" -Action $L_ChangeAction -SourceIdentifier $P_Identifier
                $L_JobID = $L_Job.Id
                Write-Host "Job ID is: $L_JobID"
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " JobID with Identifier: " + $P_Identifier + " registered with ID: " + $L_JobID) 
                $L_Registered = "Yes"
                #Unregister-Event -SubscriptionId $L_JobID 
            }
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + + $global:__ERR_OBJECT_EVENT_NOT_REGISTERED__ + " " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace  
            $L_Registered = "No"
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_Registered + " " + $L_JobID) 
        Return $L_Registered, $L_JobID
    }
}


function UnRegisterFileChangeEvent {
    [CmdletBinding()]
    Param(
       [Parameter(Mandatory=$true)] [ValidateNotNullOrEmpty()] [String] $P_Identifier
    )
    Begin{
        $L_Registered = "No"
        $L_SubscriptionID = 0
        $L_RandomExeCode = (GetRandomValue)
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Started with Parameters: " + $MyInvocation.BoundParameters.Keys + " With Values: " + $MyInvocation.BoundParameters.Values )
    }
    Process{
        try {
            if(Get-EventSubscriber | Where-Object -Property SourceIdentifier -eq $P_Identifier) {
                $L_Job = Get-EventSubscriber | Where-Object -Property SourceIdentifier -eq $P_Identifier
                $L_SubscriptionID = $L_Job.SubscriptionId
                Unregister-Event -SubscriptionId $L_SubscriptionID
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " JobID with Identifier: " + $P_Identifier + " with ID: " + $L_SubscriptionID + " is Unregistered" ) 
                Exit
            } else {
                WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " JobID with Identifier: " + $P_Identifier + " does not exists. Can not Unregister the Job Identifier") 
            }
        }
        catch {
            WriteLog $(__FILE__) $(__LINE__) "E" ($MyInvocation.InvocationName + " " + " " + $L_RandomExeCode + " Error " + + $global:__ERR_OBJECT_EVENT_NOT_REGISTERED__ + " " + (FormatError -P_Error $_))
            Write-Host $_.ScriptStackTrace  
            $L_Registered = "No"
        }
    }
    end{
        WriteLog $(__FILE__) $(__LINE__) "I" ($MyInvocation.InvocationName + " " + $L_RandomExeCode + " Completed with Return Values: " + $L_Registered + " " + $L_JobID) 
        Return $L_Registered, $L_JobID
    }
}

#$L_Service = GetServiceDetailsByName -P_JsonServiceName "AdobeARMservice"
#Write-Host $L_Service.Status

#StopService_ByName -P_JSONServiceParamName "ServiceNameToStop" -P_AdminRightsRequired "Yes"
#StartService_ByName -P_JSONServiceParamName "ServiceNameToStart" -P_AdminRightsRequired "Yes"

#Create HashTable

<#
$L_HashTable = @{}
$RegExOptions = [System.Text.RegularExpressions.RegexOptions]::Compiled + [System.Text.RegularExpressions.RegexOptions]::Singleline #+ [System.Text.RegularExpressions.RegexOptions]::IgnoreCase 
[RegEx]::New($Matches.Pattern, $RegExOptions)
$L_Hashtable.Add(1, @{Counter = 0; MinOccurance = 3; Description = "Whereever Error is Found"; Pattern = [RegEx]::New("Susheel", $RegExOptions) })
$L_Hashtable.Add(2, @{Counter = 0; MinOccurance = 3; Description = "Whereever CheckAdminRights Keyword is Found"; Pattern = [RegEx]::New("CheckAdminRights", $RegExOptions) })
$L_Hashtable.Add(3, @{Counter = 0; MinOccurance = 3; Description = "Whereever GetServiceDetailsByName Keyword is Found"; Pattern = [RegEx]::New("GetServiceDetailsByName", $RegExOptions) })
$L_Hashtable.Add(4, @{Counter = 0; MinOccurance = 3; Description = "Whereever StopService_ByName Keyword is Found"; Pattern = [RegEx]::New("StopService_ByName", $RegExOptions) })
$L_Hashtable.Add(5, @{Counter = 0; MinOccurance = 3; Description = "Whereever GetServiceDetailsByName Keyword is Found"; Pattern = [RegEx]::New("GetServiceDetailsByName", $RegExOptions) })
SearchFileForRegEx -P_FilePath "LIN20002609 - Copy.log" -P_RegExHashTable $L_Hashtable
#>

#TestJson

#CheckAdminRights


#GetAvailableDriveFreeSpaceInBytes -P_DRriveLetter "C" 
#GetFolderSizeInBytes -P_FolderPath "D:"


<#
$Begin = ((Get-Date).AddDays(-1)).ToString("dd/MM/yyyy HH:mm:ss")
$End = (Get-Date).ToString("dd/MM/yyyy HH:mm:ss")
Write-Host $Begin
GetEventLogs -P_LogName "System" -P_EntryType "Error" -P_BeginDate $Begin -P_EndDate $End -P_Source "NETLOGON" 
#>


#Send_Text_Email -P_From 'noreply@ikeadt.com' -P_To 'vipul.bhagat@inter.ikea.com' -P_Subject "Test" -P_Body "Test Email From Function" -P_Priority "High" -P_SMTP_Server 'smtp-gw.ikeadt.com'


#RegisterFileChangeEvent -P_FileName "C:\Users\vipbhaga\OneDrive - Capgemini\WORK\PowerShell\PoC" -P_Identifier "POC"
UnRegisterFileChangeEvent -P_Identifier "POC"
#CheckServerOnlineStatus -P_ServerName "127.0.0.1009090909099"
