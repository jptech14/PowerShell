PS C:\Windows\system32> import-module activedirectory; 
$servers = get-adcomputer -filter {operatingsystem -like "*server*"};
 
foreach ($server in $servers) {
    $services = $null;
    $services = gwmi win32_service -computer $server.name -ErrorAction SilentlyContinue | where {($_.startname -like "*administrator*")};
 
    if ($services -ne $null) {
        foreach ($service in $services) {
            write-host $server.name - $service.caption - $service.startname;
        }
    }
}

====================================
## Run this in the ISE as Administrator on a Domain Controller
## This will check for services running as Administrator throughout the domain
## Change the "*administrator*" to the account you want to check for