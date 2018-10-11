#Enable Network Sharing for Private and Domain network profiles
Get-NetFirewallRule -DisplayGroup 'Network Discovery'|Set-NetFirewallRule -Profile 'Private, Domain' -Enabled true

#Enable RDP

#Enable Remote Desktop connections
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\' -Name “fDenyTSConnections” -Value 0

#Enable Network Level Authentication
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\' -Name “UserAuthentication” -Value 1

#Enable Windows firewall rules to allow incoming RDP
Enable-NetFirewallRule -DisplayGroup “Remote Desktop”    

#Enable Windows Remote Management (WinRM)
Enable-PSRemoting –force

# Set WinRM start mode to automatic
Set-Service WinRM -StartMode Automatic