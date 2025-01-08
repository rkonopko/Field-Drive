@ECHO off

ECHO ::::::::::::::::::::::::::::::::::::________General INFO________::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

ECHO Hostname:
HOSTNAME

wmic bios get serialnumber

systeminfo | findstr /B /C:"OS Name" /B /C:"OS Version"

ECHO.

systeminfo | findstr /B "Domain"

ECHO.

ECHO ::::::::::::::::::::::::::::::::::::::________CPU info________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed, status

ECHO ::::::::::::::::::::::::::::::::::::::________RAM info________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

systeminfo | findstr /C:"Total Physical Memory"

wmic memorychip get devicelocator, speed

ECHO :::::::::::::::::::::::::::::::::::________HardDrive info________:::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

wmic diskdrive get model,serialnumber

ECHO ::::::::::::::::::::::::::::::::::________All User Accounts________:::::::::::::::::::::::::::::::::::::::::::::::::::::

dir c:\users\ /B

ECHO :::::::::::::::::::::::::::::::::::________Network Drives________:::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

net use

ECHO ::::::::::::::::::::::::::::::::::::::________Printers________::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

wmic printer get Name, Portname, DriverName

ECHO ::::::::::::::::::::::::::::::::::::________Network info:________:::::::::::::::::::::::::::::::::::::::::::::::::::::::

ipconfig /all

ECHO.
ECHO :::::::::::::::::::::::::::::::::::________Bitlocker info:________::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

manage-bde -protectors -get C:


:: END ::