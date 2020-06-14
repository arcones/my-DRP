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

echo 'Installing required dependencies...'
apt update 2>/dev/null && apt install -y python3 ansible
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
