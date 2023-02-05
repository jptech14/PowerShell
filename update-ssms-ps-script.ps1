$InstallerSQL = $env:TEMP + "\SSMS-Setup-ENU.exe";
Invoke-WebRequest "https://aka.ms/ssmsfullsetup" -OutFile $InstallerSQL; 
start $InstallerSQL /Quiet
Remove-Item $InstallerSQL;