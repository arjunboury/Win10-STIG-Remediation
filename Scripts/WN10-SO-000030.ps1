<#
.SYNOPSIS
    Remediates WN10-SO-000030 by enabling subcategory-based auditing.

.DESCRIPTION
    Ensures the registry key SCENoApplyLegacyAuditPolicy is set to 1 under:
    HKLM:\System\CurrentControlSet\Control\Lsa

.NOTES
    Author          : Arjun Boury
    Date Created    : 2025-05-27
    Version         : 1.0
    STIG-ID         : WN10-SO-000030

.USAGE
    Run as Administrator in PowerShell ISE:
    PS C:\> .\Set-AuditPolicySubcategory.ps1
#>

try {
    $regPath = "HKLM:\System\CurrentControlSet\Control\Lsa"
    $name = "SCENoApplyLegacyAuditPolicy"
    $value = 1

    # Create key if missing (should already exist on Win10)
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "Created registry path: $regPath"
    }

    # Set the value
    New-ItemProperty -Path $regPath `
                     -Name $name `
                     -PropertyType DWORD `
                     -Value $value `
                     -Force | Out-Null

    Write-Host "✅ Audit subcategory enforcement enabled (SCENoApplyLegacyAuditPolicy = 1)."
}
catch {
    Write-Error "❌ Failed to set registry value. Error: $_"
}
