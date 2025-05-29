<#
.SYNOPSIS
    Remediates STIG ID WN10-SO-000190 by configuring Kerberos encryption types to exclude DES and RC4.

.DESCRIPTION
    Sets the 'SupportedEncryptionTypes' registry value to allow only AES128 and AES256:
      - AES128: 0x08
      - AES256: 0x10
      - Combined: 0x18 (decimal 24)

    Registry Path:
    HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters

.NOTES
    Author          : Arjun Boury
    STIG-ID         : WN10-SO-000190
    Tested On       : Windows 10 (10.0.19045.5487)
    PowerShell Ver. : 5.1+
#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters"
    $valueName = "SupportedEncryptionTypes"
    $aes128 = 0x08
    $aes256 = 0x10
    $valueData = $aes128 -bor $aes256  # Results in 0x18 (24)

    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
        Write-Host "🛠️ Created registry path: $regPath"
    }

    New-ItemProperty -Path $regPath `
                     -Name $valueName `
                     -Value $valueData `
                     -PropertyType DWord `
                     -Force | Out-Null

    Write-Host "✅ 'SupportedEncryptionTypes' set to allow only AES128 and AES256 (0x18)."
}
catch {
    Write-Error "❌ Failed to configure Kerberos encryption types. Error: $_"
}
