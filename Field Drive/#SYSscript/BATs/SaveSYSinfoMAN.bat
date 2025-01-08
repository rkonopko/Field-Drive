@ECHO off

:start

ECHO Enter a destiaiton to save SYSinfo to:
set /p dest=

:confirm

ECHO Destination: %dest%
ECHO Confirm destination is correct 1 for YES 0 for NO:
set /p check=

	if %check% == 0 (GOTO :start)
	if %check% == 1 (GOTO :NEXT) else (GOTO :confirm)

:NEXT

ECHO :::::::::::::::::::::::::::::::::::::::________PC INFO________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

ECHO Hostname: >> %dest%\%computername%_SYSinfo.txt
HOSTNAME >> %dest%\%computername%_SYSinfo.txt

wmic bios get serialnumber >> %dest%\%computername%_SYSinfo.txt

systeminfo | findstr /B /C:"OS Name" /B /C:"OS Version" >> %dest%\%computername%_SYSinfo.txt

systeminfo | findstr /B "Domain" >> %dest%\%computername%_SYSinfo.txt

ECHO ::::::::::::::::::::::::::::::::::::::________CPU info________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed, status >> %dest%\%computername%_SYSinfo.txt

ECHO ::::::::::::::::::::::::::::::::::::::________RAM info________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

systeminfo | findstr /C:"Total Physical Memory" >> %dest%\%computername%_SYSinfo.txt
wmic memorychip get devicelocator, speed >> %dest%\%computername%_SYSinfo.txt

ECHO :::::::::::::::::::::::::::::::::::________HardDrive info________::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

wmic diskdrive get model,serialnumber>> %dest%\%computername%_SYSinfo.txt

ECHO :::::::::::::::::::::::::::::::::________Local User Accounts________:::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

net user >> %dest%\%computername%_SYSinfo.txt

ECHO :::::::::::::::::::::::::::::::::::________Network Drives________::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

net use >> %dest%\%computername%_SYSinfo.txt

ECHO ::::::::::::::::::::::::::::::::::::::________Printers________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

wmic printer get Name, Portname, DriverName >> %dest%\%computername%_SYSinfo.txt

ECHO ::::::::::::::::::::::::::::::::::::________Network info:________::::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt

ipconfig /all >> %dest%\%computername%_SYSinfo.txt

ECHO.
ECHO :::::::::::::::::::::::::::::::::::________Bitlocker info:________:::::::::::::::::::::::::::::::::::::::::::::::::::::: >> %dest%\%computername%_SYSinfo.txt
ECHO.

manage-bde -protectors -get C: >> %dest%\%computername%_SYSinfo.txt

:: END ::
