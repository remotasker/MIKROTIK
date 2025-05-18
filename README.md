# MikroTik RouterOS v7.x Baseline Security Script

This repository contains a baseline security configuration script for MikroTik routers running **RouterOS v7.x**. It applies security best practices to harden devices like the **hAP ax²**, **hAP ac³**, **CCR series**, and others.

## 🔐 Features

- Renames the default `admin` user and sets a strong password.
- Restricts Winbox and SSH access to LAN IPs only.
- Disables unnecessary services (Telnet, FTP, HTTP, API).
- Implements firewall rules for:
  - Allowing only trusted LAN traffic.
  - Blocking port scans and brute-force login attempts.
  - Dropping invalid and unsolicited traffic.
- DNS protection to block external recursive requests.
- TCP Syncookie enabled for DoS protection.
- Logging enabled for monitoring.
- Prepared for secure DNS (Cloudflare, Google).
- Command to check for RouterOS and firmware updates.

## 📜 How to Use

1. **Review the script:** Ensure IP subnets and ports match your environment.
2. **Modify as needed:** If your LAN subnet is different than `192.168.88.0/24`, update accordingly.
3. **Apply locally or via console:** Avoid running this remotely unless you are sure it won't lock you out.
4. **Run commands sequentially:** Paste the script into the MikroTik terminal line by line or as a batch via Winbox.

## ⚠️ Warning

> This script may block your remote access if applied without proper adjustments. Test thoroughly in a lab or local session.

## 💡 Suggestions

- For VLAN-based segmentation, Layer 7 filtering, or RADIUS-based admin login, additional rules can be added.
- Pair with regular RouterOS updates and backups for optimal security.

## ✅ Compatible Devices

Tested on:
- hAP ax²
- hAP ac³
- RB4011
- CCR2004, CCR2116
- Audience
- Other devices running RouterOS v7.x

---

## 🧾 License

MIT License. Use at your own risk.
