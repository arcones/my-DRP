## Author: Marta Arcones <marta.arcones@gmail.com>
## This script is intented to prepare any Debian host to work with it
## Debian minimal installation is recommeded
## The remaining application & configuration will be done here

## Basic utilities & libs
echo "Updating package index & upgrading dependencies..."
apt -qq update && apt -qq upgrade
echo "Done" && echo

echo "Installing basic utilities & libs..."
apt -qq install -y wget tree curl xclip firefox vim net-tools gthumb pinta git apt-transport-https ca-certificates libssl-dev build-essential gnupg-agent software-properties-common zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev
echo "Done" && echo

# VIM config
echo "Setting vim configuration..."
cp .vimrc ~/.vimrc
echo "Done" && echo

## Docker
echo "Removing previous installations of docker..."
apt -qq remove -y docker docker-engine docker.io containerd runc 
echo "Done" && echo
    
echo "Installing & configuring docker..."
apt -qq install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER
echo "Done" && echo

## Python 3
PYTHON_VERSION=3.9.0
echo "Installing pyenv & python 3..."
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"
pyenv install $PYTHON_VERSION
pip install -U pip
echo "Done" && echo

## Zooplus
### Teams, Slack....
## SDKMan
## Terraform
#git clone https://github.com/tfutils/tfenv.git ~/.tfenv
#ln -s ~/.tfenv/bin/* /usr/local/bin
#tfenv install latest
#TFSEC_VERSION="0.13.0"
#wget https://github.com/liamg/tfsec/releases/download/v$TFSEC_VERSION/tfsec-linux-amd64

## Cleanup
apt -qq autoremove -y && apt -qq autoclean -y && apt -qq upgrade -y

# Reboot the system for some changes to have effect
shutdown -r 1 "The system is going to be restarted in one minute!! Run shutdown -c to cancel it"
