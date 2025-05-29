<#
.SYNOPSIS
    Remediates STIG ID WN10-SO-000220 by enforcing NTLM SSP minimum session security for servers.

.DESCRIPTION
    Sets 'NTLMMinServerSec' to 0x20080000 (decimal 537395200) to require NTLMv2 and 128-bit encryption.

.NOTES
    Author          : Arjun Boury
    STIG-ID         : WN10-SO-000220
    Tested On       : Windows 10 (10.0.19045.5487)
    PowerShell Ver. : 5.1+
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
    $valueName = "NTLMMinServerSec"
    $desiredValue = 537395200  # 0x20080000

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
    Write-Host "✅ '$valueName' set to $desiredValue (0x20080000) for NTLM SSP server security."
}
catch {
    Write-Error "❌ Failed to configure '$valueName'. Error: $_"
}
