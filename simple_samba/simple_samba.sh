#!/bin/bash
#
# Installs, configures and activates a samba server on a Raspberry Pi.

readonly PI_USER_NAME="pi"
readonly SAMBA_CONFIG_FILE="/etc/samba/smb.conf"

apt-get update -y --force-yes
apt-get install --force-yes samba
apt-get install --force-yes samba-common-bin
smbpasswd -a ${PI_USER_NAME}

cat <<EOT >> ${SAMBA_CONFIG_FILE}
#======================= Global Settings =======================
[global]
workgroup = WORKGROUP
wide links = yes
unix extensions = no
dns proxy = no
#### Debugging/Accounting ####
log file = /var/log/samba/log.%m
max log size = 1000
syslog = 0
panic action = /usr/share/samba/panic-action %d
####### Authentication #######
security = user
map to guest = Bad User
guest account = ${PI_USER_NAME}
#======================= Share Definitions =======================
[root]
comment = Admin Config Share
path = /
browseable = yes
force user = root
force group = root
admin users = ${PI_USER_NAME}
writeable = yes
read only = no
guest ok = yes
create mask = 0777
directory mask = 0777
#-------------------------------------------------------------------
[${PI_USER_NAME}]
comment = ${PI_USER_NAME} user /home folder
path = /home/${PI_USER_NAME}
browseable = yes
force user = ${PI_USER_NAME}
force group = ${PI_USER_NAME}
admin users = ${PI_USER_NAME}
writeable = yes
read only = no
guest ok = yes
create mask = 0777
directory mask = 0777
EOT

sudo samba restart
