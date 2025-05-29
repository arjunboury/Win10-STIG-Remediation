<#
.SYNOPSIS
    Remediates STIG ID WN10-SO-000185 by disabling PKU2U authentication using online identities.

.DESCRIPTION
    Creates or updates the 'AllowOnlineID' DWORD to 0 under:
    HKLM\SYSTEM\CurrentControlSet\Control\Lsa\pku2u

.NOTES
    Author          : Arjun Boury
    STIG-ID         : WN10-SO-000185
    Tested On       : Windows 10 (10.0.19045.5487)
    PowerShell Ver. : 5.1+
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\pku2u"
    $valueName = "AllowOnlineID"
    $desiredValue = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Host "✅ 'AllowOnlineID' successfully set to 0 (disabled PKU2U online identities)."
}
catch {
    Write-Error "❌ Failed to configure 'AllowOnlineID'. Error: $_"
}
