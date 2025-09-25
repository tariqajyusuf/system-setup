Write-Host "[Powershell] Updating to latest via winget"
winget install Microsoft.PowerShell
exit 0  # Always succeed since winget fails if package is already installed.