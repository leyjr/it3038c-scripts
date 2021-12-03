$input = Read-Host "When you are ready to restart computer please type 'restart'"
switch($input){
          restart{Restart-computer -Force -Confirm:$false}
          default{write-host "Invalid input, please manually rebot the computer.'"}
          restart{Restart-computer -Force -Confirm:$false}
}