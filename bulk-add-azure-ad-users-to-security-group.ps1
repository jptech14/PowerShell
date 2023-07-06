# Connect to Azure AD
Connect-AzureAD


# Create the user file and save as .CSV
# CSV should only have UPN addreses.
# CSV header should say 'userPrincipalName'
$list = Import-Csv "C:\test\user-file-here.csv"


# Name of the AD security Group here
$group = "user group named here"

# Retrieve the object ID's from Azure
$GroupObjectID = Get-AzureADGroup -SearchString $group | Select -Property ObjectID



# Check for each user and add to the group
# List if the user is in the group already

foreach ($y in $list){
    $y2 = Get-AzureADUser -ObjectId $y.userPrincipalName | Select -Property ObjectID
    $members = Get-AzureADGroupMember -ObjectId $GroupObjectID.ObjectID -All $true
   
    if ($y2.ObjectID -in $members.ObjectID) {
        Write-Host $y.userPrincipalName'is already in the Group' -ForegroundColor Blue
    }else{
        Add-AzureADGroupMember -ObjectId $GroupObjectID.ObjectID -RefObjectId $y2.ObjectId -InformationAction SilentlyContinue
        Write-Host $y.userPrincipalName'has been added to the Group' -ForegroundColor Green
    }
   
}