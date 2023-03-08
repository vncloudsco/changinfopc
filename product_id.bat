@echo off
setlocal EnableDelayedExpansion

set file=product_id.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "product_id=!line[%index%]!"



set file=HwProfileGuid.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "MachineId=!line[%index%]!"

set file=product_id.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "SusClientId=!line[%index%]!"



set file=product_id.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "MachineGuid=!line[%index%]!"


set file=HwProfileGuid.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "HwProfileGuid=!line[%index%]!"


:: line da la mot so trong list cua file product_id.txt muon them nhieu thi them vao file do
echo Modifying registry keys...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductId" /d "%product_id%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient" /v "MachineId" /d "%MachineId%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "SusClientId" /d "%SusClientId%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography" /v "MachineGuid" /d "%MachineGuid%" -f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\IDConfigDB\Hardware Profiles\0001" /v "HwProfileGuid" /d "%HwProfileGuid%" -f



:: set product ID



set file=product_key.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "product_key=!line[%index%]!"

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Registration" /v "ProductId" /d "%product_key%" -f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v "BackupProductKeyDefault" /d "%product_key%" -f

:: set OSProductPfn.txt

set file=OSProductPfn.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "OSProductPfn=!line[%index%]!"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ProductOptions" /v "OSProductPfn" /d "%OSProductPfn%" -f



:: set OSProductContentId

set file=product_id.txt.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "OSProductContentId=!line[%index%]!"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ProductOptions" /v "OSProductContentId" /d "%OSProductContentId%" -f






echo Finish updating registry...