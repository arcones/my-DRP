#!/bin/bash

# Author: Marta Arcones <marta.arcones@gmail.com>

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

yum install -y ansible
ansible-playbook local-playbook.yml
