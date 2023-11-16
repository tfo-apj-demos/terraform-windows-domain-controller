# Define the parameters
$domainName = ""
$netBIOSName = ""
$SafeModeAdministratorPassword = "" # This should be changed to a secure password
$dnsDelegation = $false
$databasePath = "C:\Windows\NTDS"
$domainMode = "7" # Represents Windows Server 2022
$forestMode = "7" # Represents Windows Server 2022
$installDNS = $true
$logPath = "C:\Windows\NTDS"
$sysvolPath = "C:\Windows\SYSVOL"
$noRebootOnCompletion = $false
$force = $true

# Convert the plain text password to a secure string
$SecureSafeModeAdministratorPassword = ConvertTo-SecureString $SafeModeAdministratorPassword -AsPlainText -Force

# Install the AD DS role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Import the AD DS module
Import-Module ADDSDeployment

# Install the new AD forest
Install-ADDSForest `
    -CreateDnsDelegation:$dnsDelegation `
    -DatabasePath $databasePath `
    -DomainMode $domainMode `
    -DomainName $domainName `
    -DomainNetbiosName $netBIOSName `
    -ForestMode $forestMode `
    -InstallDns:$installDNS `
    -LogPath $logPath `
    -NoRebootOnCompletion:$noRebootOnCompletion `
    -SysvolPath $sysvolPath `
    -SafeModeAdministratorPassword $SecureSafeModeAdministratorPassword `
    -Force:$force