# ======================
# MikroTik Security Setup Script
# RouterOS v7.x
# ======================

# Rename default user and set strong password
/user set 0 name=admin-renamed password="Str0ngP@ssw0rd"

# Set DNS with security
/ip dns set servers=1.1.1.1,8.8.8.8 allow-remote-requests=yes
/ip firewall filter add chain=input protocol=udp port=53 src-address-list=!LAN action=drop comment="Drop DNS requests not from LAN"

# Define LAN address list
/ip firewall address-list
add address=192.168.88.0/24 list=LAN

# Configure Services
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set www-ssl disabled=yes
set api disabled=yes
set api-ssl disabled=yes
set winbox address=192.168.88.0/24 port=8291
set ssh address=192.168.88.0/24 port=2222

# Firewall Rules
/ip firewall filter
add chain=input connection-state=established,related action=accept comment="Allow Established/Related"
add chain=input connection-state=invalid action=drop comment="Drop Invalid"
add chain=input src-address-list=LAN action=accept comment="Allow LAN access to router"
add chain=input protocol=tcp psd=21,3s,3,1 action=add-src-to-address-list \
    address-list=port_scanners address-list-timeout=1d comment="Detect port scans"
add chain=input src-address-list=port_scanners action=drop comment="Drop port scanners"
add chain=input protocol=tcp dst-port=8291,2222 connection-state=new \
    src-address-list=brute_list action=drop comment="Drop brute force attackers"
add chain=input protocol=tcp dst-port=8291,2222 connection-state=new \
    action=add-src-to-address-list address-list=brute_list address-list-timeout=1d comment="Detect brute force"
add chain=input action=drop comment="Drop all other input"

# Connection tracking protection
/ip firewall connection tracking set tcp-syncookie=yes

# Logging
/system logging add topics=firewall,info action=memory

# Check for updates (manual)
/system package update check-for-updates

