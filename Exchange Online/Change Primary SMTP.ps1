#Change Primary SMTP and Generate Output CSV of changes

Import-Csv "$env:USERPROFILE/Desktop/Office365Input.csv" | foreach {
Set-Mailbox $_.Alias -WindowsEmailAddress $_.NewEmail 
Get-Mailbox $_.Alias | select DisplayName, Alias, PrimarySmtpAddress, EmailAddresses, userprincipalname, windowsemailaddress | Export-CSV "$env:USERPROFILE/Desktop/Office365Input.csv" -Append
}