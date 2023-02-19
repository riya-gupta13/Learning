class UserDefinedException : System.Exception {
    [string] $P_additionalData
    UserDefinedException($Message, $P_additionalData) : base($Message) {
        $this.P_additionalData = $P_additionalData
    }
}

function Get-ScriptLineNumber { return $MyInvocation.ScriptLineNumber }
function Get-ScriptName { return $MyInvocation.ScriptName }
function Get-HostName {return $env:COMPUTERNAME}
function Get-CurrentUserName {return $env:UserName}


Del alias:__LINE__
Del alias:__FILE__
Del alias:__HOSTNAME__
Del alias:__USERNAME__

new-item alias:__LINE__              -value Get-ScriptLineNumber
new-item alias:__FILE__              -value Get-ScriptName 
new-item alias:__HOSTNAME__          -value Get-HostName 
new-item alias:__USERNAME__          -value Get-CurrentUserName 

$global:__ERR_STOP_SERVICE__                          = "ERR_0000001 - Unable to Stop Service"
$global:__ERR_START_SERVICE__                         = "ERR_0000002 - Unable to Start Service"
$global:__ERR_NO_ADMIN_RIGHTS__                       = "ERR_0000003 - Admin Rights not there"
$global:__ERR_SERVICE_NAME_NOT_FOUND__                = "ERR_0000004 - Service Name not found"
$global:__ERR_SERVICE_DISPLAY_NAME_NOT_FOUND__        = "ERR_0000005 - Service Display Name not found"
$global:__ERR_LOAD_JSON__                             = "ERR_0000006 - Error while loading JSON Configuration file"
$global:__ERR_READ_JSON_PARAM__                       = "ERR_0000007 - Error while Reading Parameter from JSON"
$global:__ERR_FOLDER_NOT_EXISTS__                     = "ERR_0000008 - Folder Path does not exists"
$global:__ERR_FOLDER_SIZE__                           = "ERR_0000009 - Error while getting Folder Size"
$global:__ERR_SERVER_OFFLINE__                        = "ERR_0000010 - Server is Offline"
$global:__ERR_OBJECT_EVENT_NOT_REGISTERED__           = "ERR_0000011 - Error while registering ObjectEvent"
