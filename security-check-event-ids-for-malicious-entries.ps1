# Retrieve Potentially Malicious PowerShell Event Log Entries using Event ID
$id = "4104"
$events = Get-WinEvent -FilterHashtable @{ Path='C:\Users\Administrator\Downloads\pwsh.evtx'; Id=$id }
$events | Select ID, Message

# Query Event Log Entries to Retrieve Malicious PowerShell Commands
$events = Get-WinEvent -Path 'C:\Users\Administrator\Downloads\pwsh.evtx' | Where-Object {$_.Message -like '*PowerShell*'}
$events | Select ID, Message