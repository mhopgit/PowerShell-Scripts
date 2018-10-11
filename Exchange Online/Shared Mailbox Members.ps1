$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

#Grab Data
$Mailboxes = Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize:Unlimited | Select Identity,Alias,DisplayName | sort displayname

#List and exports the permissions to a CSV file
$mailboxes | sort displayname | foreach {Get-MailboxPermission -Identity $_.alias | ft identity,user,accessrights} | Export-csv "$env:USERPROFILE\Desktop\SharedMailboxPermissions.csv"
