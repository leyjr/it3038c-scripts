#changes to directory where data is located
cd C:\it3038c-scripts\project3

#runs a small powershell script that sets desktop to a specified background
.\SetBackground.ps1

#runs a script that clears all of the start menu tiles
.\ClearStartMenu.ps1

#runs a batch that clears the items pinned to the taskbar
.\ClearTaskbar.bat

#Here just a couple programs are installed. In real world there will be a couple more here. There are pop ups waiting for the user to continue.
.\ChromeSetup.exe
$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Once Chrome has installed click OK to install BB.", 0, "Waiting for User", 0)

.\BbRevu20.2.60.exe
$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Once BB installs click OK to finish the script.", 0, "Waiting for User", 0)
#here is a batch that cleans the C Drive.
.\CleanMyPC.bat

#This copy's contents of one folder and puts the copy onto the public desktop so any user will have access
Copy-Item -Path "C:\it3038c-scripts\project3\SampleDocs\*" -Destination "C:\Users\Public\Desktop" -Recurse

#This is a command to reboot the computer. The command waits for the user to input the "restart" command.
$input = Read-Host "The script has finished running. When you are ready to restart computer please type 'restart'"
switch($input){
          restart{Restart-computer -Force -Confirm:$false}
    default{write-warning "Invalid input, please manually restart the computer"}
}
