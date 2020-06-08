#!/bin/bash

set -e # Stop the script if any command fails

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Hostname of the target node management
if [ -z "$1" ] || [ -z "$2" ]; then
    printf "You should provide the hostname and the IP of the target node as argument for this script\n"
    printf "Example: ./control_node towanda 192.168.0.11"
    exit 1
else
    hostname="$1"
    IP="$2"
    print "A target node named $hostname with IP $IP will be configured for provisioning with ansible\n"
fi

# Remove prossible leftovers from know_hosts
regex="/^$hostname   .+$/d"
sed -i.bak -E $regex /home/${whoami}/.ssh/known_hosts

# Append to hosts file the IP and hostname of the target
echo "$IP $hostname" >> /etc/hosts

systemctl stop NetworkManager.service
systemctl start NetworkManager.service

# Send ssh key to the target
sudo -u ansible -- ssh-copy-id -o $hostname
