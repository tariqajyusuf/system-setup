# init.ps1
# Runs the system setup assuming a Windows system.
[CmdletBinding()]
Param ()

Write-Host "tariqajyusuf/system-setup ALPHA build"
Write-Host
Write-Host

Write-Host "Checking if repo was downloaded locally"
Set-Location $PSScriptRoot
if (-Not (Test-Path -Path ".git")) {
  Write-Host "Repo not downloaded, fetching latest"

  $TempDirectory = New-Item -ItemType Directory -Path "./.tmp" -Force
  Set-Location $TempDirectory
  Invoke-WebRequest https://github.com/tariqajyusuf/system-setup/archive/refs/heads/main.zip -OutFile "archive.zip"
  Expand-Archive "archive.zip" -DestinationPath $TempDirectory
  Set-Location "system-setup-main"
}

# Make sure we're running on Windows by running a command that is only there.
try {
  $OS = Get-ComputerInfo -Property "OSName" 
  if (-Not $OS -like "*Windows*") {
    Write-Error "It looks like you're trying to run this on a non-Windows machine, use ./init.sh intead"
    exit 1
  }
}
catch {
  Write-Error "It looks like you're trying to run this on a non-Windows machine, use ./init.sh intead"
  exit 1
}

Write-Host "Setting up for Windows..."
Write-Host "Running setup scripts..."
$Scripts = Get-ChildItem -Path ./setup/*/windows.ps1
foreach ($Script in $Scripts) {
  & $Script
  if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
  }
}

Write-Host "Available Modules:"
$Scripts = Get-ChildItem -Path ./modules/* -File
foreach ($Script in $Scripts) {
  Write-Host " - ${Script##*/}"
}

Write-Host
Write-Host "This script by default will install all modules, are there any modules you want to exclude? (comma-separated list, no spaces)"
$ExcludeModules = Read-Host

Write-Host "Running module scripts..."
$Scripts = Get-ChildItem -Path ./modules
foreach ($Script in $Scripts) {
  if ($ExcludeModules -notcontains ${Script##*/}) {
    & $Script/windows.ps1
  }
}