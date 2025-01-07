@echo off
:: Cleaning temporary files
echo Cleaning temporary files...
del /q /f /s %TEMP%\*
del /q /f /s C:\Windows\Temp\*
del /q /f /s "%USERPROFILE%\AppData\Local\Temp\*"
echo Done cleaning temporary files.

:: Optimizing disk
echo Optimizing disk...
defrag C: /O
echo Disk optimization complete.

:: Scanning and repairing corrupted files
echo Scanning and fixing corrupted files...
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
echo System file check complete.

:: Disabling unnecessary services
echo Disabling unnecessary services...
sc config "SysMain" start=disabled
sc config "WSearch" start=disabled
echo Unnecessary services disabled.

:: Refreshing network
echo Refreshing network settings...
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo Network settings refreshed.

:: Restarting Windows Explorer
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Windows Explorer restarted.

:: Script complete
echo All tasks completed successfully!
pause
