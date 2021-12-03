This is a script that I hope will be part of a larger project. The goal of this script is to clear certain windows defaults and do some automation of our deployments at my workplace by having a script take care of many of the task we first do on a new machine.

For my script you will want to download the entire contents of the "proj2" folder. This will contain the main "project2.ps1" script but also contain other mini scripts and programs that are installed during my script.

This script makes quite a few settings changes so it would better to do on sandbox environment or watch the video that I will provide of me running it on my systsem.

In my actual script I have a few things commented out so that they are not always running during the testing phase.  If you try to run this script while I am still working on it, you will want to uncomment the lines that look like actual code.

This will change to the directory where the .exe's are located.
cd C:\it3038c-scripts\project2

This script clears the start menu tiles so that we could pin the ones that would relate to our compnay.
.\ClearStartMenu.ps1

Like the start menu script, this script clears the taskbar so that we can pin programs that relate to my company
.\ClearTaskbar.bat

Next, in my directory for this project are a couple examples of programs we will download onto all computers, this will execute these programs.
.\ChromeSetup.exe
.\readerdc64_en_ka_cra_install.exe


Get-DscResource -Module ComputerManagementDsc

#Copy-Item -Path C:\SampleFolder2\* -Destination %userprofile%\Desktop\

This next part will run a script that does a clean up on the C drive.  The is equivalent to going to the properties of the C drive and doing "Disk Cleanup".  This will be the last part of the script to do a nice clean up.
.\CleanMyPC
