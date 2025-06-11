# Script to search Windows Event Viewer Security Logs for last 24 hours of user logins
$startTime = (Get-Date).AddDays(-1)
Get-WinEvent -FilterHashtable @{
    LogName = 'Security';
    ID = 4624;
    StartTime = $startTime
} | ForEach-Object {
    $user = ($_.Properties[5].Value)
    $time = $_.TimeCreated
    [PSCustomObject]@{
        UserName = $user
        Time     = $time
    }
} | Sort-Object Time -Descending
