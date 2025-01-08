Field Drive


Field Drive is a combination of batch files to help automate and simplify certain IT tasks.

It is great for older workstations, and upgrading them.

Field Drive also works well in emergencies when info and or backups are needed quickly from multiple workstations.
________________________________________________________________________________________________________________________________________________________________________

What Field Drive does:
_____________________

System info
- Displays, does not save, info about the workstation such as: hostname, serial, OS, version, hardware info, network info, Bitlocker, and more.

Save System Info
- Runs System Info but saves it to a text file in the "SYSinfo" folder.

Save System Info (manual)
- Same as above but manual entry of file path to save to.

--------------------------------------------------------------------------------------------------------------------------------------------------------

Backup Data

**Important** Close out of everything or reboot before backing up. RoboCopy is used for backing up and works well, however any files open or in use will not be copied.

- Displays the user list (checks "users" folder and displays the folder names) and adds a number next to each user.
  Enter the number next to the username to select it, and then choose 1 to confirm or 0 to choose again.

- Once the user is selected that user's data will be backed up unless option 6 or 5 (set user options) are chosen, or if you exit the loop and re-enter the backup option.

- The backup choices are:

Desktop, Documents, Downloads, Pictures, and Videos (works best for/ default)

Choose just one of the above (more options / separate menu)

Entire user profile
(disclaimer the entire profile backup takes a long time due to multiple individual files and multiple failures and a 3 second timeout in RoboCopy. This program is more suited for, and efficient at, copying specific folders like desktop, documents, or all of those at once.

(additional disclaimer) if there are more than 10 users you will need to use "Set user Manual". this is because you cannot have an array in an array in batch scripts, so the user list needs to be hard coded and currently only goes up to 10, it can be increased to more.

--------------------------------------------------------------------------------------------------------------------------------------------------------

Prep

Prep options such as setting basic settings like setting time zone, power options, disable sleep etc. Hidden because it can change settings if clicked through and only useful for preps and specific situations.

--------------------------------------------------------------------------------------------------------------------------------------------------------

Additional Notes

The main batch file is called "Main.bat" in the BATs folder. The shortcut MAIN is used to run it and runs as admin automatically. However, the shortcut can have issues at times after being changed or moved, it is best to re-create the shortcut and make sure to run as admin automatically. You can also run "Main.bat" in the BATs folder as admin if having issues and need the program to work.

