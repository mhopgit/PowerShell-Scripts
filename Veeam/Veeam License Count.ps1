#Add Required PowerShell module
Add-PsSnapin VeeamPSSnapIn


$FromAddress = "monitor@email.com"
$ToAddress = "recipient@email.com"
$SendingServer =  "(Mail Relay.com)"
$MessageSubject = "Veeam License Summary"
$SMTPClient = New-Object System.Net.Mail.SMTPClient $SendingServer
$TotalCount = 0

############################################################################################################

foreach ($job in (Get-VBRJob))
	{
	$TotalCount += ($job | get-vbrjobobject).count
	}

$Body = "Total VM VBR Count: " + $TotalCount	
$SMTPMessage = New-Object System.Net.Mail.MailMessage -ArgumentList $FromAddress, $ToAddress, $MessageSubject, ($Body)
$SMTPMessage.IsBodyHTML = "True"
$SMTPClient.Send($SMTPMessage)	