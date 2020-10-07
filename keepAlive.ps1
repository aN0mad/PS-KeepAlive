#Change keys with this link https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys.send?redirectedfrom=MSDN&view=netframework-4.7.2#System_Windows_Forms_SendKeys_Send_System_String_

$time = 0         #Varible to keep track of the time
$KeyToPress = '^' #Key to press
Write-Host "Time since started: "$time " seconds"
while($true){
    sleep 10
    $time+=10
    Write-Host "Time since started: "$time " seconds"

    #Push CTRL every 40 seconds
    if($time % 40 -eq 0){ 
        Write-Host "Pushing CTRL"
        $x = New-Object -COM WScript.Shell 
        $x.SendKeys($KeyToPress)   
    } 
    
    #Kill Spotify process after 1 hour
    if($time -eq 3600) {
        $date = Get-Date;
        Write-host "Killing spotify at " $date
        Stop-Process -name Spotify
        break;
    }
}