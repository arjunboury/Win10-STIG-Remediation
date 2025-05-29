<#
.SYNOPSIS
    Remediates STIG ID WN10-SO-000180 by disabling NTLM fallback to null sessions.

.DESCRIPTION
    Creates or updates the 'allownullsessionfallback' DWORD to 0 under:
    HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0

.NOTES
    Author      : Arjun Boury
    STIG-ID     : WN10-SO-000180
    PowerShell  : 5.1+
    Tested On   : Windows 10 (10.0.19045.5487)
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
    $name = "allownullsessionfallback"
    $value = 0

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $name -Value $value -Type DWord
    Write-Host "✅ Set '$name' to $value under $regPath"
}
catch {
    Write-Error "❌ Failed to set '$name'. Error: $_"
}
