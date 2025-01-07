@echo off
echo Cleaning Temporary Files...
del /s /q /f %temp%\*
del /s /q /f C:\Windows\Temp\*
del /s /q /f C:\Windows\Prefetch\*

echo Optimizing Drives...
defrag C: /O

echo Checking Disk for Errors...
chkdsk C: /F /R

echo Flushing DNS Cache...
ipconfig /flushdns

echo Resetting Network Settings...
netsh int ip reset
netsh winsock reset

echo Checking System Files...
sfc /scannow

echo Repairing Windows Image...
DISM /Online /Cleanup-Image /RestoreHealth

echo Cleanup Done!
pause
