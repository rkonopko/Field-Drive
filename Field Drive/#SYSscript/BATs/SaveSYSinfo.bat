@ECHO off

ECHO ::::::::::::::::::::::::::::::::::::________General INFO________::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO Hostname:
HOSTNAME

wmic bios get serialnumber

systeminfo | findstr /B /C:"OS Name" /B /C:"OS Version"

systeminfo | findstr /B "Domain"

ECHO ::::::::::::::::::::::::::::::::::::::________CPU info________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed, status

ECHO ::::::::::::::::::::::::::::::::::::::________RAM info________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

systeminfo | findstr /C:"Total Physical Memory"
wmic memorychip get devicelocator, speed

ECHO :::::::::::::::::::::::::::::::::::________HardDrive info________:::::::::::::::::::::::::::::::::::::::::::::::::::::::

wmic diskdrive get model,serialnumber

ECHO ::::::::::::::::::::::::::::::::::________All User Accounts________:::::::::::::::::::::::::::::::::::::::::::::::::::::

dir c:\users\ /B

ECHO :::::::::::::::::::::::::::::::::________Local User Accounts________::::::::::::::::::::::::::::::::::::::::::::::::::::

net user

ECHO :::::::::::::::::::::::::::::::::::________Network Drives________:::::::::::::::::::::::::::::::::::::::::::::::::::::::

net use

ECHO ::::::::::::::::::::::::::::::::::::::________Printers________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

wmic printer get Name, Portname, DriverName

ECHO ::::::::::::::::::::::::::::::::::::________Network info:________:::::::::::::::::::::::::::::::::::::::::::::::::::::::

ipconfig /all

ECHO.
ECHO :::::::::::::::::::::::::::::::::::________Bitlocker info:________::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

manage-bde -protectors -get C:

ECHO.
ECHO ::::::::::::::::::::::::::::::::::::::________App List:________:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

wmic product get name,version

:: END ::