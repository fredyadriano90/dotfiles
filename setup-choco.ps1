#install choco
Write-Host "Installing/Updating Choco"
if ($null -eq (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else {
    & choco update Chocolatey
}

Write-Host  "Intstalling minimal setup"
& choco install `
    7zip `
    chocolateygui `
    git `
    oh-my-posh `
    microsoft-windows-terminal `
    notepadplusplus `
    powertoys `
    pwsh `
    sysinternals `
    which `
    -y


# add tools
if ((Read-Host "Install dev tools: (y/N)").ToLower() -eq 'y') {
    & choco install `
        autohotkey.install `
        azure-cli `
        eartrumpet `
        insomnia-rest-api-client `
        nodejs-lts `
        nswagstudio `
        postman `
        vscode `
        -y
}

if ((Read-Host "Install paid tools: (y/N)").ToLower() -eq 'y') {
    & choco install `
        office365proplus `
        -y
}

if ((Read-Host "Install gaming apps: (y/N)").ToLower() -eq 'y') {
    & choco install `
        epicgameslauncher `
        steam-client `
        -y
}

if ((Read-Host "Install Browsers: (y/N)").ToLower() -eq 'y') {
    & choco install `
        Firefox `
        GoogleChrome `
        -y
}

if ((Read-Host "Install other apps: (y/N)").ToLower() -eq 'y') {
    & choco install `
        logitech-camera-settings `
        logitech-options `
        microsoft-teams `
        paint.net `
        azure-data-studio `
        azurestorageemulator `
        devtoys `
        slack `
        drawio `
        th-ch-youtube-music `
        lightshot `
        googledrive `
        powershell-core `
        -y
}
