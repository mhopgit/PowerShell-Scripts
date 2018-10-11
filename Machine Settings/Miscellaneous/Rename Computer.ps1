$ServerName = Read-Host -Prompt 'What is the computer name?'
$UserCredential = Get-Credential
Rename-Computer -NewName "$ServerName" -DomainCredential $UserCredential -Restart