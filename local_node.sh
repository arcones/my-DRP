#!/bin/bash

echo 'setting -e flag set, so the script will stop if any command inside it fails...'
set -e
echo 'Done'

echo 'Checking if the script was executed with sudo...'
if [ "$EUID" != 0 ]; then
    echo 'This script must be run as root'
    exit 1
fi

echo 'Checking script arguments...'
if [ -z "$1" ]; then
    echo 'You should provide the password of ansible user as argument for this script'
    echo 'Example:  sudo ./local_node mySuperStrongPassword'
    exit 1
else
    password="$1"
    echo 'Password received'
fi

echo 'Done'

echo 'Installing required dependencies...'
apt update 2>/dev/null && apt install -y software-properties-common python3 python3-pip
echo 'Done'

echo 'Installing ansible...'
pip3 install ansible
echo 'Done'

echo 'Creating user ansible to provision...'
userdel -rf ansible || true
useradd -m ansible
echo -e "$password\n$password" | passwd ansible
echo 'Done'

echo 'Append ansible user to sudoers not to have to provide the password while provisioning remotely...'
(echo ; echo 'ansible      ALL=(ALL)       NOPASSWD: ALL') >> /etc/sudoers
echo 'Done'

echo 'Preparation is done, you can run ansible locally now!'
