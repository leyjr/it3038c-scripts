#This is a script that I hope will be part of a larger project. The goal of this script is to clear certain windows defaults and do some automation of our deployments.


#changes to the directory where the .exe's are located.
cd C:\it3038c-scripts\project1
#.\ClearStartMenu.ps1
#.\ClearTaskbar.bat
#.\ChromeSetup.exe
#.\readerdc64_en_ka_cra_install.exe

Get-DscResource -Module ComputerManagementDsc

#Copy-Item -Path C:\SampleFolder2\* -Destination %userprofile%\Desktop\

