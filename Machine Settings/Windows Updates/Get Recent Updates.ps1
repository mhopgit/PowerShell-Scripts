<#

https://gallery.technet.microsoft.com/scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc

Module can be installed automatically:

Install-PackageProvider -Name Nuget -Force
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Install-Module PSWindowsUpdate -Force

Module can be installed manualy by downloading Zip file and extract in two places:

%USERPROFILE%\Documents\WindowsPowerShell\Modules
%WINDIR%\System32\WindowsPowerShell\v1.0\Modules

#>

#Get all installed updates
Get-WUHistory | 

select ComputerName, KB, Date, Title, Description, 
UninstallationNotes, SupportUrl |

sort Date -Descending |

Export-CSV $env:USERPROFILE\Desktop\InstalledUpdates.csv