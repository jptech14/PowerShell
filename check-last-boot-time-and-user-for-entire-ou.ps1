$Computers = ((Get-ADComputer -filter * -SearchBase "OU-information-here").Name)

foreach($computer in $computers){
    if(Test-Connection -ComputerName $computer -Quiet -count 1){
        $info = Get-WmiObject win32_operatingsystem -ComputerName $computer
        
        $hash = @{
            PcInfo   = ($info | select @{n='LastBootUpTime';e={$_.ConverttoDateTime($_.lastbootuptime)}}).LastBootUpTime
            PCName   = ($info | select CSName).csname
            UserInfo = (Get-WmiObject win32_ComputerSystem  -ComputerName $computer | select username).username
        }
        
        $object = New-Object psobject -Property $hash
        $object | select PCName,PcInfo,UserInfo
        
    }else{
        Write-Output "$computer Offline"
    }
}