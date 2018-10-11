#Add Required PowerShell module
Add-PsSnapin VeeamPSSnapIn

#Connect to Backup and Replication Server
Connect-VBRServer -Server "ATL-TX-VBAK-01" -User "OnClo" -Password ""

#Get list of jobs and their last status
$details = @() 
$VbrJobs = Get-VBRJob | Sort-Object typetostring, name
     
Foreach($Job in $VbrJobs)
{
    $columns = New-Object psobject
    $columns | Add-Member -MemberType NoteProperty -Name "Job Name" -Value $Job.Name
    $columns | Add-Member -MemberType NoteProperty -Name "Job Type" -Value $Job.JobType
    $columns | Add-Member -MemberType NoteProperty -Name "Job State" -Value $Job.GetLastState()  
$details += $columns
}

$details | Export-CSV $env:USERPROFILE\desktop\VeeamStatus.csv