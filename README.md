# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it.

It uses **ansible** to install packages and configure the system as I like :woman_technologist:

## Requirements :warning:

- [Target node] Ubuntu OS is installed with the user `arcones`
- [Target node] The script `target_node.sh` has been run succesfully

- [Control node] The user that will be used will be `arcones`
- [Control node] An ssh key is assigned to `arcones` user
- [Control node] Ansible is installed, as well as `python3` and `ssh`
- [Control node] The script `control_node.sh` has been run succesfully

## Execute the playbook
```
ansible-playbook site.yml -i hosts -u arcones -e {{ username }}
```

[![Build Status](https://travis-ci.org/arcones/my-DRP.svg?branch=master)](https://travis-ci.org/arcones/my-DRP)
