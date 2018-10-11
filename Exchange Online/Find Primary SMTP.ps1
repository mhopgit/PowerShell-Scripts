$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
Get-mailbox -ResultSize Unlimited | select DisplayName, Alias, PrimarySmtpAddress, EmailAddresses | Export-csv "$env:USERPROFILE\Desktop\AllMailUsers.csv"
