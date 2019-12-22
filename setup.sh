#!/usr/bin/env bash

# Author: Marta Arcones <marta.arcones@gmail.com>
# This script is intented to prepare any Debian host to work with it
# Debian minimal installation is recommeded
# The remaining application & configuration will be done here

export DEBIAN_FRONTEND=noninteractive
export PYTHON_VERSION=3.9.0

execute_command () {
    echo "$2..." && echo
    eval $1
    if [ "$?" != 0 ]; then
        echo "There was an error running \"$2\"!"
        exit 1
    else
        echo "Done $2" && echo
    fi
}

# Basic utilities & libs
execute_command "apt update -y && apt full-upgrade -y" "updating package index & upgrading dependencies"

execute_command "apt install -y wget tree curl xclip firefox vim net-tools gthumb pinta git apt-transport-https ca-certificates libssl-dev build-essential gnupg-agent software-properties-common zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev" "installing basic utilities & libs"

execute_command "git --version" "testing git installation"

# VIM config
execute_command "cp .vimrc ~/.vimrc" "setting vim configuration"

# Docker
execute_command "apt remove -y docker docker-engine docker.io containerd runc" "removing previous installations of docker"
execute_command "apt install -y docker" "installing docker"
execute_command "docker -v" "testing docker installation"

# Python & pip 3
execute_command "git clone https://github.com/pyenv/pyenv.git ~/.pyenv" "cloning pyenv project"
execute_command "echo 'export PYENV_ROOT=\"$HOME/.pyenv\"' >> ~/.bashrc && echo 'export PATH=\"$PYENV_ROOT/bin:$PATH\"' >> ~/.bashrc" "updating .bashrc"
execute_command "echo -e "if command -v pyenv 1>/dev/null 2>&1; then\n eval \"$(pyenv init -)\"\nfi" >> ~/.bashrc" "updating .bashrc again"
execute_command "exec '$SHELL' && pyenv install $PYTHON_VERSION" "installing python 3"
execute_command "pip install -U pip" "upgrading pip"

### Teams, Slack....
## SDKMan
## Terraform
#git clone https://github.com/tfutils/tfenv.git ~/.tfenv
#ln -s ~/.tfenv/bin/* /usr/local/bin
#tfenv install latest
#TFSEC_VERSION="0.13.0"
#wget https://github.com/liamg/tfsec/releases/download/v$TFSEC_VERSION/tfsec-linux-amd64

# Cleanup
execute_command "apt full-upgrade -y" "cleaning up not used packages, indexes, etc"

# Reboot the system for some changes to have effect
shutdown -r 1 "The system is going to be restarted in one minute!! Run shutdown -c to cancel it"
