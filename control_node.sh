#!/bin/bash

echo 'setting -e flag set, so the script will stop if any command inside it fails...'
set -e
echo 'Done'

echo 'Checking if the script was executed with sudo...'
if [ "$EUID" != 0 ]; then
    echo 'This script must be run as root'
    exit 1
fi
echo 'Done'

echo 'Checking script arguments...'
if [ -z "$1" ] || [ -z "$2" ]; then
    echo 'You should provide the hostname and the IP of the target node as argument for this script'
    echo 'Example: ./control_node towanda 192.168.0.11'
    exit 1
else
    hostname="$1"
    IP="$2"
    echo 'A target node named $hostname with IP $IP will be configured for provisioning with ansible'
fi
echo 'Done'

echo 'Installing required dependencies (currently supporting apt and yum package managers) ...'
DEPENDENCIES="openssh-server ansible python3"

if [ -n "$(which apt-get 2>/dev/null)" ]; then
    apt update 2>/dev/null && apt install -y $DEPENDENCIES
else
    yum update --skip-broken 2>/dev/null && yum -y install $DEPENDENCIES
fi
echo 'Done'

echo 'Creating user ansible to provision...'
userdel -rf ansible
useradd -m ansible && passwd -d ansible
echo 'Done'

echo 'Creating ssh key for ansible user...'
KEY_FILE='/home/ansible/.ssh/ansible.rsa'
su - ansible -c "ssh-keygen -t rsa -N '' -f $KEY_FILE <<< y"
echo 'Done'

echo 'Updating /etc/hosts with the target node details...'
grep -qxF "$IP $hostname" /etc/hosts || echo "$IP $hostname" >> /etc/hosts
systemctl stop NetworkManager.service
systemctl start NetworkManager.service
echo 'Done'

echo 'Copying ansible user ssh key to the target node...'
su - ansible -c "ssh-copy-id -i $KEY_FILE $hostname"
echo 'Done'

echo 'Preparation is done, ansible provisioning will be controlled from this node!'
