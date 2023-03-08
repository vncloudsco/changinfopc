@echo off
setlocal EnableDelayedExpansion

set file=InstallDate.txt

set /a count=0
for /f "usebackq delims=" %%i in ("%file%") do (
  set /a count+=1
  set "line[!count!]=%%i"
)

set /a index=%random% %% count + 1
set "InstallDate=!line[%index%]!"

:: line da la mot so trong list cua file product_id.txt muon them nhieu thi them vao file do
echo Modifying registry keys...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "InstallDate" /t REG_DWORD /d "%InstallDate%" -f
echo Finish updating registry...