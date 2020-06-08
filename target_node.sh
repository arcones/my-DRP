#!/bin/bash
set -e # Stop the script if any command fails

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# User management
if [ -z "$1" ]; then
    printf "You should provide the user of the target node as argument for this script\n"
    printf "This user will be the one to provision your Ubuntu OS\n"
    printf "It is recommended that the user is the one you daily use\n"
    printf "Example: ./target_node paco"
    exit 1
else
    user="$1"
    print "The target node will be prepared to run ansible with $user user\n"
fi

# Install ssh server
apt install -y openssh-server

# Ensure ssh is running
systemctl status ssh --no-pager
systemctl enable ssh

if [ $? -eq 0 ]; then
    echo "ssh server is running"
else
   systemctl start ssh
fi

# Open Ubuntu firewall for ssh
ufw allow ssh

# Append to sudoers not to have to provide the password
echo "$user      ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
