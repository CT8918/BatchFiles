::Batch File to create options Enable or Disable Sticky Keys.
::Initial Creator: Clayton D. Terrill - May need updated for future. Valid as of August 2016
@ECHO off
:: -------------------------------------
:: Check Windows Version
:: 5.0 = W2K
:: 5.1 = XP
:: 5.2 = Server 2K3
:: 6.0 = Vista or Server 2K8
:: 6.1 = Win7 or Server 2K8R2
:: 6.2 = Win8 or Server 2K12
:: 6.3 = Win8.1 or Server 2K12R2
:: 10.0 = Windows 10 or Windows Server 2016
:: --------------------------------------
ECHO OS Detection:  Starting
ver | findstr /i "5\.0\."
if %ERRORLEVEL% EQU 0 (
ECHO  OS = Windows 2000
goto win00
)
ver | findstr /i "5\.1\."
if %ERRORLEVEL% EQU 0 (
ECHO OS = Windows XP
goto winXP
)
ver | findstr /i "5\.2\."
if %ERRORLEVEL% EQU 0 (
ECHO OS = Server 2003
goto winServer03
)
ver | findstr /i "6\.0\." > nul
if %ERRORLEVEL% EQU 0 (
ECHO OS = Vista / Server 2008
goto winVista
)
ver | findstr /i "6\.2\." > nul
if %ERRORLEVEL% EQU 0 (
ECHO OS = Windows 8 / Server 2012
goto win8
)
ver | findstr /i "6\.3\." > nul
if %ERRORLEVEL% EQU 0 (
ECHO OS = Windows 8.1 / Server 2012R2
goto win81
)
::ECHO OS Detection:  Starting
ver | findstr /i "6\.1\." > nul
if %ERRORLEVEL% EQU 0 (
ECHO OS = Windows 7 / Server 2008R2
goto win7
)
ver | findstr /i "10\.0\." > nul
if %ERRORLEVEL% EQU 0 (
ECHO OS = Windows 10 / Windows Server 2016
goto win10
)
ECHO OS Undetermined. Not a Windows OS.
goto endFinal
:win00
goto end
:winXP
goto end
:winServer03
goto end
:winVista
goto end
:win7
goto end
:win8
goto end
:win81
goto end
:win10
goto end
:end
:endFinal
pause