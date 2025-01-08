::::::::::::::::::::::::::::::::::::::::
:: Field Drive 1.4
:: 
:: Last updated 1/8/25
:: Created by Robert Konopko           
::::::::::::::::::::::::::::::::::::::::
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Copyright (c) 2024, Robert Konopko All rights reserved.
::
:: Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
::
:: Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
:: Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other 
:: materials 
:: provided with the distribution. All advertising materials mentioning features or use of this software must display the following acknowledgement: This product includes software 
:: developed by the Robert Konopko. Neither the name of Robert Konopko nor the names of his contributors may be used to endorse or promote products derived 
:: from this software  without specific prior written permission.
::
:: THIS SOFTWARE IS PROVIDED BY Robert Konopko AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
:: A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Robert Konopko BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
:: (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
:: WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@ECHO OFF

COLOR 3

:: Sets directory to location of bat file

%~d0
cd %~dp0

:: Sets folder path variables
:: Main folder: BATs

Set BATs=%cd%
cd %BATs%

cd..
Set SYSscript=%cd%

cd Installers\
Set Installers=%cd%
cd..

cd SYSinfo\
Set SYSinfo=%cd%
cd..

cd Backups\
Set Backups=%cd%
cd..

:: Sets directory to BATs folder where the batch files reside

cd %BATs%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO Please choose from one of the following options:

:::::::::::::::::::::::::::::::::::::::::::::::::::::::

:START

ECHO.
ECHO 1 System Info
ECHO 2 Save System Info
ECHO 3 Save System Info (manual)
ECHO ----------------------------
ECHO 4 System Info (more options)
ECHO 5 Backup Data
ECHO 6 Prep
ECHO 7 Change Theme
ECHO 8 System Image
ECHO 9 Installers
ECHO 10 Checklist

set /p X=
echo.
cls

if %X%==0 (GOTO %X%)
if %X%==1 (GOTO %X%)
if %X%==2 (GOTO %X%)
if %X%==3 (GOTO %X%)
if %X%==4 (GOTO %X%)
if %X%==5 (GOTO %X%)
if %X%==6 (GOTO %X%)
if %X%==7 (GOTO ChangeTheme)
if %X%==8 (GOTO SystemImage)
if %X%==9 (GOTO Installers)
if %X%==10 (GOTO Checklist) else (ECHO Invalid option
Pause
cls)

ECHO.
GOTO START

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:0

ECHO PC Transfer Automation


:: Save Sys info
:: call SaveSYSinfo.bat >> %SYSinfo%\%computername%_SYSinfo.txt


:: Backup Data


Pause
cls
GOTO START

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:1

ECHO System Info selected
ECHO.

call SYSinfo.bat


ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO :::::::::::::::::::::::::::::::::::::::: SYS Info Complete ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

Pause

ECHO.
ECHO Press any key to clear and continue.
ECHO.

Pause
cls
GOTO START
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:2

ECHO Save System Info selected
ECHO.

call SaveSYSinfo.bat >> %SYSinfo%\%computername%_SYSinfo.txt

ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO :::::::::::::::::::::::::::::::::::::: Save SYS Info Complete :::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.

Pause

cls
GOTO START
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:3

ECHO Save System Info (manual) selected
ECHO.

Call SaveSYSinfoMAN

cls
GOTO START
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: System Info (more options)
:::::::::::::::::::::::::::::

:4

ECHO System Info (more options)
ECHO.
ECHO 1 Group Policy Info
ECHO 2 Save Group Policy Info
ECHO 3 Return to main menu

set /p SIO=
echo.
cls

if %SIO%==1 (GOTO SIO_1)
if %SIO%==2 (GOTO SIO_2)
if %SIO%==3 (GOTO SIO_3) else (ECHO Invalid option
Pause
cls)

ECHO.
GOTO :4

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SIO_1

ECHO Group Policy Info:
ECHO.

gpresult /R

ECHO.
PAUSE
cls

GOTO 4

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SIO_2

gpresult /R >> %SYSinfo%\%computername%_GPinfo.txt

ECHO.
PAUSE
cls

GOTO 4
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SIO_3

GOTO START
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::: Set User for Backup :::::::::::::::::::::::::::::::

:5

dir c:\users\ /B > user_list.txt

set "file=user_list.txt"
set /A i=0

for /F "usebackq delims=" %%a in ("%file%") do (
set /A i+=1
call set array[%%i%%]=%%a
call set n=%%i%%
)


:UserList

ECHO ---------------- USER list ----------------------

for /L %%i in (1,1,%n%) do call echo %%i %%array[%%i]%%

ECHO -------------------------------------------------

set file=user_list.txt
set /a cnt=0
for /f %%a in ('type "%file%"^|find "" /v /c') do set /a cnt=%%a

::echo %file% has %cnt% lines

echo.

:UserC

ECHO Choose user, enter the number next to the user you want to select:

set /p XU=

:: CLS::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cls

set Xuser="Error try again"


if %XU%==1 (
ECHO %array[1]%
set xuser=%array[1]%
)

if %XU%==2 (
ECHO %array[2]%
set xuser=%array[2]%
)

if %XU%==3 (
ECHO %array[3]%
set xuser=%array[3]%
)

if %XU%==4 (
ECHO %array[4]%
set xuser=%array[4]%
)

if %XU%==5 (
ECHO %array[5]%
set xuser=%array[5]%
)

if %XU%==6 (
ECHO %array[6]%
set xuser=%array[6]%
)

if %XU%==7 (
ECHO %array[7]%
set xuser=%array[7]%
)

if %XU%==8 (
ECHO %array[8]%
set xuser=%array[8]%
)

if %XU%==9 (
ECHO %array[9]%
set xuser=%array[9]%
)

if %XU%==10 (
ECHO %array[10]%
set xuser=%array[10]%
)

ECHO.
ECHO The selected user is: %Xuser%
ECHO.
ECHO Choose 1 to continue or 0 to choose again.

set /p SelectUser=

:: CLS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cls

if %SelectUser%==1 (GOTO Backup) else (GOTO UserList)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:Backup

ECHO.
ECHO ------------------------ Backup Options ------------------------------
ECHO Current User: %Xuser%
ECHO ----------------------------------------------------------------------
ECHO 1 Backup: Desktop, Documents, Downloads, Pictures, and Videos (Default)
ECHO 2 Backup Choose (more Options)
ECHO 3 Backup entire user profile
ECHO ----------------------------------------------------------------------
ECHO 4 List users
ECHO 5 Set user (choose again)
ECHO 6 Set user (manual)
ECHO ----------------------------------------------------------------------
ECHO 7 Check Backup: Desktop, Documents, Downloads, Pictures, and Videos
ECHO ----------------------------------------------------------------------
ECHO 8 Return to main menu

set /p B=
echo.
cls

if %B%==1 (GOTO 31)
if %B%==2 (GOTO 32)
if %B%==3 (GOTO 33)
if %B%==4 (GOTO 34)
if %B%==5 (GOTO 35)
if %B%==6 (GOTO 36)
if %B%==7 (GOTO 37)
if %B%==8 (GOTO 38) else (ECHO Invalid option)

ECHO.

GOTO START
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:31

ECHO Backup Default selected

cd %Backups%

robocopy C:\users\%Xuser%\desktop %computername%_%Xuser%_backup\desktop /E /COPYALL /DCOPY:DAT /R:10 /W:2
robocopy C:\users\%Xuser%\documents %computername%_%Xuser%_backup\documents /E /COPYALL /DCOPY:DAT /R:10 /W:2
robocopy C:\users\%Xuser%\downloads %computername%_%Xuser%_backup\downloads /E /COPYALL /DCOPY:DAT /R:10 /W:2
robocopy C:\users\%Xuser%\pictures %computername%_%Xuser%_backup\pictures /E /COPYALL /DCOPY:DAT /R:10 /W:2
robocopy C:\users\%Xuser%\videos %computername%_%Xuser%_backup\videos /E /COPYALL /DCOPY:DAT /R:10 /W:2

ECHO.
pause
cls

cd %BATs%

GOTO Backup

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: _________________________________________________________________________________________________________

:: Backup_Choose :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:32


ECHO.
ECHO Choose one, Backup for:
ECHO 1 Desktop
ECHO 2 Documents
ECHO 3 Downloads
ECHO 4 Pictures
ECHO 5 Videos
ECHO 6 Return to Backup Menu

set /p BC1=
echo.
cls

if %BC1%==1 (GOTO 3B1)
if %BC1%==2 (GOTO 3B2)
if %BC1%==3 (GOTO 3B3)
if %BC1%==4 (GOTO 3B4)
if %BC1%==5 (GOTO 3B5)
if %BC1%==6 (GOTO 3B6) else (ECHO Invalid option)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3B1


ECHO Copying: Desktop
echo.

cd %Backups%
robocopy C:\users\%Xuser%\desktop %computername%_%Xuser%_backup\desktop /E /COPYALL /DCOPY:DAT /R:10 /W:2
cd %BATs%

ECHO.
pause
cls

GOTO 32

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3B2

ECHO Copying: Documents
echo.

cd %Backups%
robocopy C:\users\%Xuser%\documents %computername%_%Xuser%_backup\documents /E /COPYALL /DCOPY:DAT /R:10 /W:2
cd %BATs%

ECHO.
pause
cls

GOTO 32

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3B3

ECHO Copying: Downloads
echo.

cd %Backups%
robocopy C:\users\%Xuser%\downloads %computername%_%Xuser%_backup\downloads /E /COPYALL /DCOPY:DAT /R:10 /W:2
cd %BATs%

ECHO.
pause
cls

GOTO 32

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3B4

ECHO Copying: Pictures
echo.

cd %Backups%
robocopy C:\users\%Xuser%\pictures %computername%_%Xuser%_backup\pictures /E /COPYALL /DCOPY:DAT /R:10 /W:2
cd %BATs%

ECHO.
pause
cls

GOTO 32

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3B5

ECHO Copying: Videos
echo.

cd %Backups%
robocopy C:\users\%Xuser%\videos %computername%_%Xuser%_backup\videos /E /COPYALL /DCOPY:DAT /R:10 /W:2
cd %BATs%

ECHO.
pause
cls

GOTO 32


:: Template ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: :3B*

:: ECHO Option * selected, copying: **********
:: echo.

:: cd %Backups%
:: robocopy C:\users\%Xuser%\********* %Xuser%_backup\************* /E /COPYALL /DCOPY:DAT /R:10 /W:2
:: cd %BATs%


:: ECHO.
:: pause
:: cls

:: GOTO 32


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:3B6

ECHO Return to Backup Menu
cls

GOTO Backup
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Full user backup

:33

ECHO Full user backup
ECHO.

cd %Backups%

robocopy C:\users\%Xuser% %computername%_%Xuser%_backup\ /E /COPYALL /DCOPY:DAT /R:10 /W:2

cd %BATs%

ECHO.
pause
cls

GOTO Backup

::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:34

cls

ECHO ---------------- USER list ----------------------
dir c:\users\ /B
ECHO -------------------------------------------------
ECHO.
Pause

cls

GOTO Backup

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:35

ECHO Choose User Selected
ECHO.

GOTO UserList

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:36

ECHO 35 Set user (Manual)

ECHO Enter the username:
set /p Xuser=
cls

GOTO Backup


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:37

ECHO 37 Check Backups Default

cd %Backups%

robocopy C:\users\%Xuser%\desktop %computername%_%Xuser%_backup\desktop /L /NS /NP /E /NJH
robocopy C:\users\%Xuser%\documents %computername%_%Xuser%_backup\documents /L /NS /NP /E /NJH
robocopy C:\users\%Xuser%\downloads %computername%_%Xuser%_backup\downloads /L /NS /NP /E /NJH
robocopy C:\users\%Xuser%\pictures %computername%_%Xuser%_backup\pictures /L /NS /NP /E /NJH
robocopy C:\users\%Xuser%\videos %computername%_%Xuser%_backup\videos /L /NS /NP /E /NJH

ECHO.
pause
cls

cd %BATs%

GOTO Backup

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:38

GOTO Start

::------------------------------------------------------------------------------



:::::::::::::::::::::::::::::: System Image ::::::::::::::::::::::::::::::::::::::

:SystemImage

ECHO.
ECHO Choose from the following:
ECHO 1 System Image Automated
ECHO 2 System Image Manual

set /p X=

if %X%==1 (wbadmin start backup -backuptarget:%~d0 -include:C: -allcritical -quiet)
if %X%==2 (sdclt.exe)

PAUSE
cls


GoTo Start

:::::::::::::::::::::::::::::: Installers ::::::::::::::::::::::::::::::::::::::

:Installers

ECHO Installers
Pause
cls

GoTo Start

:::::::::::::::::::::::::::::: Change Theme ::::::::::::::::::::::::::::::::::::::

:ChangeTheme

ECHO.
ECHO Choose from the following themes:
ECHO 0 Text White (default)
ECHO 1 Text Blue
ECHO 2 Text Green
ECHO 3 Text Aqua
ECHO 4 Text Red
ECHO 5 Backgournd White Text Black
ECHO 6 Cutsom
ECHO 7 Return to main menu

set /p X=

cls

if %X%==0 (Color 0f)
if %X%==1 (Color 01)
if %X%==2 (Color 02)
if %X%==3 (Color 03)
if %X%==4 (Color 04)
if %X%==5 (Color 70)
if %X%==6 (GOTO ChangeThemeCustom)
if %X%==7 (GOTO START)


GOTO ChangeTheme


:::::::::::::::::::::::::::::: Change Theme Custom ::::::::::::::::::::::::::::::::::::::

:ChangeThemeCustom

cls
ECHO Enter values (0 - 9 or A - F) to change Background and Text colors:
ECHO -----------------------------------------------------------------------------
ECHO 0 Black
ECHO 1 Blue
ECHO 2 Green
ECHO 3 Aqua
ECHO 4 Red
ECHO 5 Purple
ECHO 6 Yellow
ECHO 7 White
ECHO 8 Gray
ECHO 9 Light blue
ECHO a Light green
ECHO b Light aqua
ECHO c Light red
ECHO d Light purple
ECHO e Light yellow
ECHO f Bright white
ECHO.

ECHO Set Background Color:
set /p Background=

ECHO Set Text Color:
set /p Text=

echo.
cls

Color %Background%%Text%

GOTO ChangeTheme


:::::::::::::::::::::::::::::: Checklist ::::::::::::::::::::::::::::::::::::::

:Checklist

cls

ECHO Did you check:
ECHO -----------------------------------------------------------------------------
ECHO Files: Desktop, Documents, Downloads, Pictures, Videos, ????
ECHO Browser: Passwords, Bookmarks
ECHO Printers and Scanners
ECHO Network Drives
ECHO APPs and Licensing info
ECHO.

PAUSE

cls

GOTO START


:::::::::::::::::::::::::::::::::: PREP ::::::::::::::::::::::::::::::::::::::::

:6

:PrepStart

ECHO Hidden Option Prep
ECHO.
ECHO 21 Basic Prep
ECHO 22 Install Apps (currently nothing)
ECHO 23 Office 365 isntall (installer removed)
ECHO 24 Umbrella Fix
ECHO 25 OneDrive Duplicate
ECHO 26 Return to main menu

set /p prep=
echo.
cls

if %prep%==21 (GOTO %prep%)
if %prep%==22 (GOTO %prep%)
if %prep%==23 (GOTO %prep%)
if %prep%==24 (GOTO %prep%)
if %prep%==25 (GOTO %prep%)
if %prep%==26 (GOTO %prep%) else (ECHO Invalid option)

ECHO.

GOTO START

::------------------------------------------------------------------------------

:: Prep---------------------

:21

ECHO Option 21 selected
ECHO.

call Basic_Prep.bat

ECHO.
pause
cls

GOTO PrepStart

:22

ECHO Option 22 selected
ECHO.


ECHO.
pause
cls

GOTO PrepStart

:23

ECHO Option 23 selected
ECHO.

cd %Installers%\64bit\

start cmd /k "setup.exe /configure 64bit.xml"

::::::::::::::: Return to BATs folder aka where the "main" batch file is running from
cd %BATs%

ECHO.
pause
cls

GOTO PrepStart

:24

ECHO Option 24 selected
ECHO.

call UmbreallaRoamingfix.bat

ECHO.
pause
cls

GOTO PrepStart

:25

ECHO Option 25 selected
ECHO.

OneDrive_Dupe.bat

ECHO.
pause
cls

GOTO PrepStart

:26

ECHO Option 26 selected
ECHO.

GOTO Start

::------------------------------------END--------------------------------------------
