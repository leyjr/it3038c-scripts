Warning! This will change settings to your computer.  If you plan to run this script on your own a sandbox environment is recommended. If you do not want these settings to be changed on your computer I will provide a video demonstrating this script working.

This is a script that I hope will be part of a larger project. The goal of this script is to clear certain windows defaults and do some automation of our deployments at my workplace by having a script take care of many of the task we first do on a new machine.  Even after this class I plan to continue to add to this script.  Ideally I will have copies of this script for specific deployments as it relates to departments and the specific applications they use and so on.

The idea is that this script will be on a thumb drive or other network share that I will run it from.  For the purpose of this project I just have a shortcut to the script on Desktop of the Windows computer in sandbox.  

If you plan to run this script on your own you will want to make sure you have a path to the following directory "C:\it3038c-scripts\project3".  You will also want to make sure you have all of the contents of the folder "project3" downloaded and in that folder as well. There is shortcut located in folder, just drag this to the desktop and then close all windows.  Then right click on the shortcut and select "run with powershell".

To keep my main script clean, I have the "project3.ps1" script just executing separate scripts that I have put together.

Below is the explanation of what is happening in each step of the script:

This will change to the directory where the .exe's and other scripts are located.
cd C:\it3038c-scripts\project2

First this little PS1 script changes the desktop background of the computer. This chnage takes effect after next logon.
.\setBackground.ps1

This script clears the start menu tiles so that we could pin the ones that would relate to our compnay.
.\ClearStartMenu.ps1

Like the start menu script, this script clears the taskbar so that we can pin programs that relate to my company
.\ClearTaskbar.bat

Next, I have the script installing a couple programs that are downloaded in the "project3" directory.  This demonstrates some company related programs.  This will evetually be department specific as it relates to my company.  After these two commands run there are pop up boxes waiting for the user to continue.  This is done to prevent the computer from crashing when having too many things install at once.
.\ChromeSetup.exe
$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Once Chrome has installed click OK to install BB.", 0, "Waiting for User", 0)

.\BbRevu20.2.60.exe
$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Once BB installs click OK to finish the script.", 0, "Waiting for User", 0)

This next part will run a script that does a clean up on the C drive.  The is equivalent to going to the properties of the C drive and doing "Disk Cleanup"
.\CleanMyPC

This command below will copy the content of the "SampleDocs" directory to the Public Desktop. This is so that any user who signs onto this computer will have access to the company documents.

Copy-Item -Path "C:\it3038c-scripts\project3\SampleDocs\*" -Destination "C:\Users\Public\Desktop" -Recurse

Below is a command that will reboot the computer.  But it waits for the user to input the "restart" command.  This allows the user finish intalling the given programs before the computer automatiaclly.  After the reboot you will see the background change that previously took place.

$input = Read-Host "When you are ready to restart computer please type 'restart'"
switch($input){
          restart{Restart-computer -Force -Confirm:$false}
    default{write-warning "Invalid input, please manually restart the compute"}
}

