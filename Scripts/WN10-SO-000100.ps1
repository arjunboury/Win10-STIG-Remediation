<#
.SYNOPSIS
    Remediates WN10-SO-000100 by enforcing SMB client packet signing.

.DESCRIPTION
    Sets 'RequireSecuritySignature' to 1 under LanmanWorkstation parameters.

.NOTES
    Author     : Arjun Boury
    STIG-ID    : WN10-SO-000100
    Tested On  : Windows 10 (10.0.19045.5487)
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
    $valueName = "RequireSecuritySignature"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Host "✅ SMB client signing enforced (RequireSecuritySignature = 1)."
}
catch {
    Write-Error "❌ Failed to enforce SMB client signing. Error: $_"
}
