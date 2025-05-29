<#
.SYNOPSIS
    Remediates STIG ID WN10-SO-000205 by setting LanMan authentication level to NTLMv2 only, refusing LM and NTLM.

.NOTES
    Author          : Arjun Boury
    STIG-ID         : WN10-SO-000205
    Tested On       : Windows 10 (10.0.19045.5487)
    PowerShell Ver. : 5.1+
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
    $valueName = "LmCompatibilityLevel"
    $desiredValue = 5

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Host "✅ '$valueName' successfully set to $desiredValue (Send NTLMv2 response only, refuse LM and NTLM)."
}
catch {
    Write-Error "❌ Failed to configure '$valueName'. Error: $_"
}
