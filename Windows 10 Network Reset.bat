@echo off
::Author Walter Carman
::Date 12/18/16
::Version 1.00
:check_Permissions

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo.
    ) else (
		echo.
		echo.
        echo ERROR:
		echo.
		echo The requested operation requires elevation ^(Run as administrator^)
		echo.
		echo Please right click on the script file and select "Run as Administrator"
		echo.
		echo.
		timeout 15
		exit
		 
		
    )

 
ipconfig /all>>%UserProfile%\Desktop\Network_Settings.txt
ipconfig
echo.
echo.
echo.
echo The output of "ipconfig" was saved to the Desktop as Network_Settings.txt
echo.
echo.
echo Take Note of Any Static IP Address As They WILL be RESET. Press Any Key to Continue
echo.
echo.
pause>nul
ipconfig /flushdns
nbtstat -R 
nbtstat -RR 
netsh int ip reset c:\resetlog.txt
netsh winsock reset exit
echo.
echo.
echo Press any Key To Restart Computer NOW Or Exit out of the command prompt to Restart LATER.
echo.
pause>nul
echo.
echo.
echo Restarting Now...
shutdown.exe /r /t 5
