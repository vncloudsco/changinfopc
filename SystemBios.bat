@echo off
setlocal EnableDelayedExpansion

set file=SystemBios.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "boissss=!line[%index%]!"

set file=time.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "timesdk=!line[%index%]!"

set file=SystemBios.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "smf=!line[%index%]!"

set file=ident.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "ident=!line[%index%]!"


:: line da la mot so trong list cua file product_id.txt muon them nhieu thi them vao file do
echo Modifying registry keys...
:: reg add "Computer\HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "InstallDate" /t REG_DWORD /d "%InstallDate%" -f

reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "SystemVersion" /d "%boissss%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System" /v "SystemBiosVersion" /d "%boissss%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "BIOSVersion" /d "%boissss%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "BaseBoardVersion" /d "%boissss%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "BIOSReleaseDate" /d "%timesdk%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "BIOSVendor" /d "%smf%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System" /v "SystemBiosDate" /d "%timesdk%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System" /v "Identifier" /d "%ident%" -f


:: BaseBoardProduct

set file=BaseBoardProduct.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "BaseBoardProduct=!line[%index%]!"

reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "BaseBoardProduct" /d "%BaseBoardProduct%" -f



:: SystemManufacturer


set file=SystemManufacturer.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "SystemManufacturer=!line[%index%]!"

reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "SystemManufacturer" /d "%SystemManufacturer%" -f



:: SystemProductName

set file=SystemProductName.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "SystemProductName=!line[%index%]!"

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SystemInformation" /v "SystemProductName" /d "%SystemProductName%" -f
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v "SystemProductName" /d "%SystemProductName%" -f



echo Finish updating registry...