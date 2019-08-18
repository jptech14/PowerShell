Get-ADGroupMember -Identity (Read-Host 'Enter group name') | 
    Select Name | 
        Export-Csv -Path C:\temp\members.csv -NoTypeInformation