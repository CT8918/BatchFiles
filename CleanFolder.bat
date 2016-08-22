::Batch File to delete all files within a directory.
:: Clayton D. Terrill - May need updated for future. August 2016.
@ECHO off
cls
ECHO Clean a Folder
ECHO.
ECHO Do you want to delete all files within a folder?
:start
ECHO.
ECHO 1. Yes
ECHO 2. Clean Temp Folder
ECHO 0. No
set /p choice=Yes Or No?: 
rem if not '%choice%'=='' set choice=%choice:~0;1% 
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto yes
if '%choice%'=='2' goto temp
if '%choice%'=='0' goto no
ECHO.
ECHO Invalid Input: Clean a Folder?
goto start
:yes
ECHO Enter the path of the folder you wish to clean.
set /p folderPath="Enter path of folder: "
echo y | del %folderPath%\*.* /S
rd %folderPath% /s /q
md %folderPath%
Cacls C:\TEMP /E /P EveryOne:F
ECHO. && ECHO.
ECHO Clean Another Folder?
goto start
:temp
echo y | del c:\temp\*.* /S
rd c:Temp\ /s /q
md c:\Temp
Cacls C:\TEMP /E /P EveryOne:F
ECHO. && ECHO.
ECHO Clean Another Folder?
goto start
:no
ECHO You Selected No.
goto end
:end
pause
