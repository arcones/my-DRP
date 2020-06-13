#!/bin/bash

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Remove prossible leftovers from know_hosts
sed -i.bak -E '/^towanda .+$/d' /home/arcones/.ssh/known_hosts

# Append to hosts file the IP of the target
echo "192.168.0.11 towanda" >> /etc/hosts

systemctl stop NetworkManager.service
systemctl start NetworkManager.service

# Send ssh key to the target
sudo -u arcones -- ssh-copy-id towanda
