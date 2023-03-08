set /A newName=%RANDOM% * 100 / 3276 + 1

echo Modifying registry keys...

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName" /v "ComputerName" /d "%newName%" -f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName" /v "ComputerName" /d "%newName%" -f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\ComputerName\ComputerName" /v "ComputerName" /d "%newName%" -f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName" /v "ComputerName" /d "%newName%" -f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ComputerName" /v "ComputerName" /d "%newName%" -f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "Hostname" /d "%newName%" -f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "NV Hostname" /d "%newName%" -f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\Tcpip\Parameters" /v "Hostname" /d "%newName%" -f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\Tcpip\Parameters" /v "NV Hostname" /d "%newName%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /d "%newName%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AltDefaultDomainName" /d "%newName%" -f

echo Finish updating registry...

echo Update DNS...
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
echo Finish updating DNS...

set computername=%newName%
