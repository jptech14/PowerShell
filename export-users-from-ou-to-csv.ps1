# Change the OU to the OU you require. Find the OU in AD and right-click.
# Go to Attribute Editor and copy the Distinguished Name. Paste that in the OU part of this script
Get-ADUser -Filter * -Properties * -SearchBase "Change this record" | select displayname, userPrincipalName, Enabled  | export-csv -path c:\userexport1.csv