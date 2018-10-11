#Set a static DNS entry
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("8.8.8.8","8.8.4.4")

#Use DHCP for DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses

#Set a static IP address
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.0.10 -PrefixLength 24 -DefaultGateway 192.168.0.254

#Set interface to DHCP
Set-NetIPInterface -InterfaceAlias "Ethernet" -DHCP Enabled