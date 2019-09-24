# Gets mailbox sizes and exports to .csv
# Run from Exchange Management Powershell
# Run as Administrator

Get-Mailbox | Get-MailboxStatistics | Select-Object DisplayName,{$_.TotalItemSize.Value.ToMB()} | export-csv -path C:\yourmailboxes.csv