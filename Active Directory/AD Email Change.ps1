#Get AD User information
Get-ADUser -Filter * -Properties Displayname, samaccountname, mail | Select-Object Displayname, samaccountname, mail, proxyaddresses | Export-Csv "$env:USERPROFILE\desktop\LocalADExport.csv" 

#Set AD Email field and add address to ProxyAddress list   
Import-Csv "$env:USERPROFILE\desktop\ADInput.csv" | foreach {
Set-ADUser -Identity $_.samaccountname -Remove @{Proxyaddresses="SMTP:"+$_.mail}
Set-ADUser -Identity $_.samaccountname -EmailAddress $_.NewEmail -Add @{Proxyaddresses="SMTP:"+$_.NewEmail}
Set-ADUser -Identity $_.samaccountname -Add @{Proxyaddresses="smtp:"+$_.mail}
Get-ADUser $_.samaccountname -Properties Displayname, samaccountname, mail, proxyaddresses | Select-Object Displayname, samaccountname, mail, proxyaddresses | Export-Csv "$env:USERPROFILE\desktop\ADOutput.csv" -Append
}