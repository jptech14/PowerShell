# Set file and folder path for Integration Runtime Installation
$folderpath="c:\windows\temp"
$filepath="$folderpath\IntegrationRuntime_5.20.8244.2.msi"
 
#If SSMS not present, download
if (!(Test-Path $filepath)){
write-host "Downloading Microsoft Integration Runtime..."
$URL = "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/IntegrationRuntime_5.20.8244.2.msi"
$clnt = New-Object System.Net.WebClient
$clnt.DownloadFile($url,$filepath)
Write-Host "Integration Runtime download complete" -ForegroundColor Green
 
}
else {
 
write-host "Located the MSI, moving on to install..."
}
 
# start the Integration Runtime installer
write-host "Beginning Integration Runtime install..." -nonewline
Start-Process c:\windows\temp\IntegrationRuntime_5.20.8244.2.msi -ArgumentList "/quiet"


write-Host "Integration Runtime installation complete" -ForegroundColor Green