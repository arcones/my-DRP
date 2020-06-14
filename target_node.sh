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
if [ -z "$1" ]; then
    echo 'You should provide the password of ansible user as argument for this script'
    echo 'Ansible user will be used to provision your Ubuntu OS'
    echo 'Example: ./target_node mySuperStrongPassword'
    exit 1
else
    password="$1"
    echo 'Password received'
fi
echo 'Done'

echo 'Installing required dependencies...'
apt update 2>/dev/null && apt install -y openssh-server
echo 'Done'

echo 'Launching ssh service...'
systemctl status ssh --no-pager
systemctl enable ssh

if [ $? -eq 0 ]; then
    echo "ssh server is running"
else
   systemctl stargnot ssh
fi
echo 'Done'

echo 'Creating user ansible to provision...'
userdel -rf ansible || true
useradd -m ansible
echo -e "$password\n$password" | passwd ansible
echo 'Done'

echo 'Opening firewall to allow ssh connections...'
ufw allow ssh
echo 'Done'

echo 'Append ansible user to sudoers not to have to provide the password while provisioning remotely...'
(echo ; echo 'ansible      ALL=(ALL)       NOPASSWD: ALL') >> /etc/sudoers
echo 'Done'

echo 'Preparation is done, this node is configured as target for ansible!'
