$NewUPN = $null
$OldUPN = $null

UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential
Set-MsolUserPrincipalName -UserPrincipalName $NewUPN -NewUserPrincipalName $OldUPN