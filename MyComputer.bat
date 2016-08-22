@echo off
::Clayton D. Terrill - May need updated in the future. Valid as of August 2016.
if EXIST %TEMP%\osname.txt goto check
systeminfo | find "OS Name" > %TEMP%\osname.txt
:check
FOR /F "usebackq delims=: tokens=2" %%i IN (%TEMP%\osname.txt) DO set vers=%%i
echo %vers% | find "XP Professional" > nul
if %ERRORLEVEL% == 0 goto winxp
reg.exe load HKU\DefUser "C:\Users\Default\ntuser.dat"
reg.exe add "HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg.exe add "HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /d 0 /f
reg.exe unload HKU\DefUser
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /d 0 /f
goto exit
:winxp
reg.exe load HKU\DefUser "C:\Documents and Settings\Default User\ntuser.dat"
reg.exe add "HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg.exe add "HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{450D8FBA-AD25-11D0-98A8-0800361B1103}" /d 0 /f
reg.exe unload HKU\DefUser
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{450D8FBA-AD25-11D0-98A8-0800361B1103}" /d 0 /f
:exit
echo. && echo My computer and User files will now showup on the desktop. && echo.