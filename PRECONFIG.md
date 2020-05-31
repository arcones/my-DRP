# Ansible configuration

## Expected scenario

- [Control node] The user that will be used will be `arcones`
- [Control node] An ssh key is assigned to `arcones` user
- [Control node] Ansible is installed, as well as `python3` and `ssh`
- [Target node] Ubuntu OS is installed with the user `arcones`

## Steps required

- [Control node] Via the LAN router, set static DHCP configuration for the target node, therefore is always assigned with the same IP
- [Control node] Add an alias in the /etc/hosts like `IP Hostname` for the target node, for example `192.168.0.11 bee-charmer`
- [Target node] Install ssh server with `sudo apt install openssh-server`
- [Target node] Open Ubuntu firewall to allow ssh connections `sudo ufw allow ssh`
- [Control node] Copy the ssh key to the target node with `ssh-copy-id Hostname`, for example `ssh-copy-id bee-charmer`
- [Target node] Edit sudoers file by doing `sudo visudo` and adding the line `arcones       ALL=(ALL)       NOPASSWD: ALL`
