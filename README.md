# 🛡️ Windows 10 STIG Remediation Scripts (PowerShell)

This repository contains PowerShell scripts for remediating **DISA STIG**(Security Technical Implementation Guides) findings on Windows 10 systems. Each script is tailored to a specific STIG ID and ensures compliance using only PowerShell—no GUI steps, GPO changes, or external tools required.

> 🔧 **Objective**: Perform secure, repeatable, and auditable system hardening using automated PowerShell-based remediation.

---

## 📁 Scripts Included

| STIG ID             | Description                                                             |
|----------------------|-------------------------------------------------------------------------|
| WN10-AU-000500       | Configure Application Event Log size                                    |
| WN10-SO-000030       | Enforce password history                                                 |
| WN10-SO-000100       | Require SMB client packet signing                                       |
| WN10-SO-000120       | Require SMB server packet signing                                       |
| WN10-SO-000180       | Prevent NTLM fallback to null session                                   |
| WN10-SO-000185       | Disable PKU2U authentication using online identities                    |
| WN10-SO-000205       | Require NTLMv2 response only and refuse LM/NTLM                         |
| WN10-SO-000215       | Enforce minimum NTLM SSP session security for **clients**               |
| WN10-SO-000220       | Enforce minimum NTLM SSP session security for **servers**               |

Each script includes:
- A PowerShell `.SYNOPSIS` and `.DESCRIPTION` header
- Error handling and output logging
- Inline comments and validation notes (if applicable)

---

## ✅ How to Use

1. **Clone the repo**:
   ```bash
   git clone https://github.com/arjunboury/Win10-STIG-Remediation.git
   cd Win10-STIG-Remediation/Scripts
   ```

2. **Open PowerShell as Administrator**

3. **Run the desired script**:
   ```powershell
   .\WN10-SO-000205.ps1
   ```

4. **(Optional)**: Use `Get-ItemProperty` commands (as found in the script comments) to verify changes.

---

## 🧪 Requirements

- Windows 10 (Tested on 10.0.19045.5487)
- PowerShell 5.1+
- Administrator privileges

---

## 🤝 Contributing

Want to help? Contributions are welcome!
- Submit pull requests for other PowerShell-only STIGs
- Report bugs or suggest improvements
- Fork and build your own hardening toolkit

---

## 📜 License

MIT License © 2025 Arjun Boury

---

## 📌 Notes

- This repository **only includes STIGs that can be fully remediated via PowerShell.**
- Scripts are designed for **local system configuration** and do not modify domain-level policies.
