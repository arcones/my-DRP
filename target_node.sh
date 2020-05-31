#!/bin/bash

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Install ssh server
apt install -y openssh-server

# Ensure ssh is running
systemctl status ssh
if [ $? -eq 0 ]; then
    echo "ssh server is running"
else
   systemctl start ssh
fi

# Open Ubuntu firewall for ssh
ufw allow ssh

# Append to sudoers not to have to provide the password
echo "arcones       ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
