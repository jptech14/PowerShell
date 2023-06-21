# This script will check which SharePoint sites a user has access to.
# Change the 'yourcompany-admin.sharepoint.com' to the real SharePoint admin site.
# change the user email address to the user's email address

# Connect to SharePoint
Connect-SPOService -Url https://yourcompany-admin.sharepoint.com/

# Set the user's email address
$userEmail = "user@company.com"

# Get all site collections in the tenant
$sites = Get-SPOSite -Limit All

# Loop through each collection and check if the user has access
foreach ($site in $sites) {

    # Get the user's permissions for the site collection

    $permissions = Get-SPOUser -Site $site.Url -LoginName $userEmail -ErrorAction SilentlyContinue
    if ($permissions) {

        # If the user has permissions, output the site collection URL

        Write-Host "User $($userEmail) has access to $($site.Url)"
    }
}
