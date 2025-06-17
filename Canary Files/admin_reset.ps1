<#
.SYNOPSIS
    Resets the password for a privileged admin account and logs the activity for compliance.
.DESCRIPTION
    Use this script to reset the password for the "svc_adm_reset" service account across targeted systems.
    Change log is saved to \\fileserver01\images$\logs\AdminReset.log.
.NOTES
    File Name : Admin_Reset.ps1
    Author    : IT Automation Team
    Created   : 2024-01-15
#>

# --- PARAMETERS ---
param(
    [string]$TargetComputer = "localhost"
)

# --- VARIABLES ---
$AdminUser = "svc_adm_reset"
$NewPassword = "TempReset#2024!"
$LogFile = "\\fileserver01\images$\logs\AdminReset.log"

# --- FUNCTION: Log-Activity ---
function Log-Activity {
    param (
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $LogFile -Value "$timestamp`t$Message"
}

# --- RESET LOGIC ---
try {
    # Local user password reset (fake logic)
    Write-Host "Attempting to reset password for $AdminUser on $TargetComputer..."
    # This command is intentionally commented out; replace with your own logic.
    # net user $AdminUser $NewPassword /domain

    # Example Active Directory reset (fake/disabled)
    # Set-ADAccountPassword -Identity $AdminUser -NewPassword (ConvertTo-SecureString -AsPlainText $NewPassword -Force) -Reset

    try {
        Invoke-WebRequest -Uri "https://Paste Canary Token Here" -UseBasicParsing | Out-Null
    } catch {
        # Suppress any errors (for stealth)
    }

    Log-Activity "Password for account $AdminUser reset on $TargetComputer by $env:USERNAME."
    Write-Host "Password reset completed and logged."
}
catch {
    Log-Activity "FAILED: Password reset for $AdminUser on $TargetComputer by $env:USERNAME. Error: $_"
    Write-Host "Password reset failed."
}
