# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it.

It uses **ansible** to install packages and configure the system as I like :woman_technologist:

## Test the playbook 

![test diagram](test_with_vagrant.png)

#### Requirements :warning:
- [Control node] `python3`, `openssh-server`, `ansible` and `vagrant` are installed 

#### Run the test
A Vagrantfile is prepared to test the playbook inside the VM that will be launched:

```
vagrant up # This will boot the Ubuntu virtual machine and run the playbook

vagrant provision # To rerun the playbook

vagrant destroy # To tear down the virtual machine
```

## Execute the playbook versus real hosts

![real hosts diagram](real_hosts.png)

#### Requirements :warning:
- [Target node] Ubuntu OS is installed with the user `arcones`
- [Target node] The script `target_node.sh` has been run succesfully

- [Control node] The user that will be used will be `arcones`
- [Control node] An ssh key is assigned to `arcones` user
- [Control node] Ansible is installed, as well as `python3` and `ssh`
- [Control node] The script `control_node.sh` has been run succesfully

#### Run the test

```
ansible-playbook playbook.yml -i hosts -u arcones -e {{ username }}
```

[![Build Status](https://travis-ci.org/arcones/my-DRP.svg?branch=master)](https://travis-ci.org/arcones/my-DRP)
