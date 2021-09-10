function getIP {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
    }

$IP = getIP
$User  = $env:USERNAME
$Body = "Test"

Send-MailMessage -To "leyjr@mail.uc.edu" -From "leyjared@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $Body -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)