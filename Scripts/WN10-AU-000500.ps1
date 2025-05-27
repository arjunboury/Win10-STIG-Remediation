<#
.SYNOPSIS
    Remediates WN10-AU-000500: Ensures the Application event log size is set to at least 32768 KB.

.DESCRIPTION
    Creates or updates the "MaxSize" DWORD value under the Group Policy registry path for the Application log:
    HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application

.NOTES
    Author          : Arjun Boury
    Date Created    : 2025-05-26
    Last Modified   : 2025-05-27
    Version         : 1.1
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-05-26
    Tested By       : Arjun Boury
    Systems Tested  : Windows 10 (10.0.19045.5487)
    PowerShell Ver. : 5.1

.USAGE
    Run this script in PowerShell ISE as Administrator:
    PS C:\> .\Set-ApplicationEventLogSize.ps1
#>

try {
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
    $valueName = "MaxSize"
    $valueData = 32768  # 32 MB

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
        Write-Host "Created registry path: $registryPath"
    }

    Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord
    Write-Host "✅ Registry value '$valueName' set to '$valueData' at '$registryPath'."
}
catch {
    Write-Error "❌ Failed to set registry value. Error: $_"
}

