<#
.SYNOPSIS
    Remediates WN10-SO-000180 by restricting remote access to SAM to administrators only.

.DESCRIPTION
    Sets the 'RestrictRemoteSAM' registry value to 'O:BAG:BAD:' under the LSA key.

.NOTES
    Author     : Arjun Boury
    STIG-ID    : WN10-SO-000180
    Tested On  : Windows 10 (10.0.19045.5487)
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
    $valueName = "RestrictRemoteSAM"
    $desiredValue = "O:BAG:BAD:"

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type String
    Write-Host "✅ 'RestrictRemoteSAM' set to restrict remote SAM access to Administrators only."
}
catch {
    Write-Error "❌ Failed to set 'RestrictRemoteSAM'. Error: $_"
}
