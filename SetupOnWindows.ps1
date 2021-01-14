Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
$Ask = 'Do you want to run this as an Administrator?
        Select "Yes" to Run as an Administrator
        Select "No" to not run this as an Administrator
        
        Select "Cancel" to stop the script.'

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    $Prompt = [System.Windows.MessageBox]::Show($Ask, "Run as an Administrator or not?", $Button, $ErrorIco) 
    Switch ($Prompt) {
        #This will debloat Windows 10
        Yes {
            Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
            Break
        }
    }
}


function installchoco { 
    
    Write-Host "Installing required Tools quickly."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco install chocolatey-core.extension -y

}

function setupall { 

    Write-Host "Installing drivers for your Phone"
    choco install git -y
    choco install adb -y
    Write-Host "Done. Now Installing the program!"
    #Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.30.0.windows.1/Git-2.30.0-64-bit.exe C:\GitSetup.exe
    #curl -sSL https://git.io/JtvVG | bash
    $wshell.Popup("Now Please connect your phone via USB cable and enable USB DEBUGGING from Developer Settings.",0,"I Know",0x0)    
    $wshell.Popup("When asked, Allow the access on your phone and tick the box to always grant the privileges.",0,"Done",0x0) 
    #$wshell.Popup("Now right click on your desktop background and click 'Git Bash' or something similar. Wait for around a minute for it to load completely. then type the following in it without the quotes. 'curl -sSL https://git.io/JtvKJ | bash'",0,"Sure",0x0)    
    
}


# function runtv {
#     & 'C:\Program Files (x86)\TeamViewer\TeamViewer.exe'
#     Invoke-WebRequest https://raw.githubusercontent.com/gamerhat18/win10script/master/essentialsInstall.ps1 C:\essentialsInstall.ps1
# }


# iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JtvVG'))

installchoco

refreshenv

setupall

refreshenv

cd C:

git clone https://github.com/gamerhat18/android-debloat
cd android-debloat
adb devices

.\debloat_script.sh
# Chris Titus' Debloat Script command given below for quick copy-paste.
# iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))

# My scripts
# https://cybrdise.com/sakshi/one


## RUN THIS SAME BUT ONLY TEAMVIEWER AUTOMATICALLY.
## iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/Jtvit'))
