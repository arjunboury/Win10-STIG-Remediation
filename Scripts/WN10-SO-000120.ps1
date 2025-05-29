<#
.SYNOPSIS
    Remediates WN10-SO-000120 by enforcing SMB server packet signing.

.DESCRIPTION
    Sets 'RequireSecuritySignature' to 1 under LanmanServer parameters.

.NOTES
    Author     : Arjun Boury
    STIG-ID    : WN10-SO-000120
    Tested On  : Windows 10 (10.0.19045.5487)
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
    $valueName = "RequireSecuritySignature"
    $desiredValue = 1

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Host "✅ SMB server signing enforced (RequireSecuritySignature = 1)."
}
catch {
    Write-Error "❌ Failed to enforce SMB server signing. Error: $_"
}
