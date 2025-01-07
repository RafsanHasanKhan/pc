@echo off
title PC Optimization Script
echo ==============================================
echo      Starting PC Optimization Script
echo ==============================================
echo.

:: Step 1: Clean Temporary Files
echo Cleaning Temporary Files...
for %%i in (%temp%,C:\Windows\Temp,C:\Windows\Prefetch) do (
    if exist %%i (
        del /s /q /f %%i\* >nul 2>&1
        echo - Cleared %%i
    ) else (
        echo - Directory %%i not found. Skipping.
    )
)
echo Temporary Files Cleanup Complete!
echo.

:: Step 2: Optimize Drives (Only for HDD)
echo Optimizing Drives...
defrag C: /O >nul 2>&1
echo Drive Optimization Complete!
echo.

:: Step 3: Check Disk for Errors (Runs on Next Restart)
echo Scheduling Disk Check for Next Restart...
echo Y | chkdsk C: /F /R >nul 2>&1
echo Disk Check Scheduled!
echo.

:: Step 4: Flush DNS Cache
echo Flushing DNS Cache...
ipconfig /flushdns >nul 2>&1
echo DNS Cache Flushed!
echo.

:: Step 5: Reset Network Settings
echo Resetting Network Settings...
netsh int ip reset >nul 2>&1
netsh winsock reset >nul 2>&1
echo Network Settings Reset Complete!
echo.

:: Step 6: Check and Repair System Files
echo Checking System Integrity (This may take some time)...
sfc /scannow
echo System File Check Complete!
echo.

:: Step 7: Repair Windows Image
echo Repairing Windows Image (This may take some time)...
DISM /Online /Cleanup-Image /RestoreHealth
echo Windows Image Repair Complete!
echo.

:: Completion Message
echo ==============================================
echo      PC Optimization Complete!
echo ==============================================
pause
