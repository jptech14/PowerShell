# Fix the VM Agent that is unresponsive in Azure
# Run these commands to remove the old VM agent
net stop RDAgent 
net stop WindowsAzureGuestAgent
net stop WindowsAzureTelemetryService

sc delete RDAgent 
sc delete WindowsAzureGuestAgent
sc delete WindowsAzureTelemetryService

# Under C:\WindowsAzure create a folder that is named OLD.
# Move any folders that are named Packages or GuestAgent into the OLD folder.
# Restart the VM to complete the uninstalling process.

# Now reinstall the VM Agent...
# Download and install the latest version of the agent installation package from here.
# https://github.com/Azure/WindowsVMAgent

# You must have Administrator rights to complete the installation.
# Install Guest Agent by using the following command:
# Navigate to the directory where the agent is.
# May need to execute with .\
# After restart VM Agent error message should go away.

msiexec.exe /i c:\VMAgentMSI\WindowsAzureVmAgent.2.7.<version>.fre.msi /quiet /L*v c:\VMAgentMSI\msiexec.log