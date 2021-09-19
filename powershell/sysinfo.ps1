function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
    }

$IP = getIP
$User  = $env:USERNAME
$Date = Get-Date -Format "dddd MM/dd/yyyy"
$Host = $env:COMPUTERNAME
$Powershell = Get-Host | Select Object-Version

$Body = "This machine's IP is $IP, User is $User, Hostname is $Host, the Powershell version is $Powershell, Today's data is $Date"

Send-MailMessage -To "leyjr@mail.uc.edu" -From "leyjared@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $Body -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)