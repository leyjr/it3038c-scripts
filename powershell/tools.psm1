Function GetIp {
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
}