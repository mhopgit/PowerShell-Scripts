$env:chocolateyUseWindowsCompression = 'true'
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
