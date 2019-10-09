# Better to run this command on its own then restart the console
# so paths are set
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation
choco install disableuac

# Apps
choco install GoogleChrome
choco install vscode

choco install 7zip.install
choco install curl

choco install filezilla
choco install git
choco install tortoisegit
# choco install SourceTree

choco install xplorer2
choco install procexp
choco install deletefiles
choco install markdownmonster
#choco install westwindwebsurge

# choco install filezilla.server

# Download files from my FTP server
# Utilities folder
# FoxPro IDE

# choco install mssql2014express-defaultinstance
# choco install mssqlservermanagementstudio2014express