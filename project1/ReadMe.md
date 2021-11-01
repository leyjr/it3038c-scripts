This is a script that I hope will be part of a larger project. The goal of this script is to clear certain windows defaults and do some automation of our deployments at my workplace

In my script here I just have separate scripts inserted.

This will change to the directory where the .exe's are located.
cd C:\it3038c-scripts\project1

This script clears the start menu tiles so that we could pin the ones that would relate to our compnay.
#.\ClearStartMenu.ps1

Like the start menu script, this script clears the taskbar so that we can pin programs that relate to my companhy
#.\ClearTaskbar.bat

Next, in my directory for this project are a couple examples of programs we will download onto all computers, this will execute these programs.
#.\ChromeSetup.exe
#.\readerdc64_en_ka_cra_install.exe


Get-DscResource -Module ComputerManagementDsc

#Copy-Item -Path C:\SampleFolder2\* -Destination %userprofile%\Desktop\
