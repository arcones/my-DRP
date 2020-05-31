#!/bin/bash

# If the script is not run with sudo, stop & warn
if [ "$EUID" != 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Append to hosts file the IP of the target
echo "192.168.0.11 towanda"

# Send ssh key to the target
ssh-copy-id towanda
