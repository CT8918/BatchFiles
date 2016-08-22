::Batch File to create options Enable or Disable Sticky Keys.
::Initial Creator: Clayton D. Terrill - May need updated for future. Valid as of August 2016
::MUST RUN BATCH FILE AS ADMINISTRATOR
@ECHO off
cls
ver | findstr /i "6\.1\." > nul
if %ERRORLEVEL% EQU 0 (
echo OS = Windows 7 / Server 2008R2
goto win7
)
ver | findstr /i "10\.0\." > nul
if %ERRORLEVEL% EQU 0 (
echo OS = Windows 10 / Windows Server 2016
goto win7
)
ECHO OS Undetermined. Not a Windows OS.
goto endFinal
:win7
cls
ECHO Enable or Disable Sticky Keys?
ECHO.
ECHO 1. Enable
ECHO 2. Disable
ECHO.
set /p choice=Select Your Choice: 
rem if not '%choice%'=='' set choice=%choice:~0;1% 
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto enable
if '%choice%'=='2' goto disable
ECHO.
goto win7
:enable
IF EXIST "C:\Windows\System32\sethcDisabled.exe" ICACLS "C:\Windows\System32\sethcDisabled.exe" /grant %username%:F
IF EXIST "C:\Windows\System32\sethcDisabled.exe" rename "C:\Windows\System32\sethcDisabled.exe" "sethc.exe
ECHO. && ECHO.
ECHO Sticky Keys Pop-Up Enabled
goto end
:disable
::sethc.exe is the name of the sticky keys executable.
IF EXIST "C:\Windows\System32\sethc.exe" ICACLS "C:\Windows\System32\sethc.exe" /grant %username%:F
IF EXIST "C:\Windows\System32\sethc.exe" rename "C:\Windows\System32\sethc.exe" "sethcDisabled.exe
ECHO. && ECHO.
ECHO Sticky Keys Pop-Up Disabled
goto end
:end
goto endFinal
:endFinal
pause


