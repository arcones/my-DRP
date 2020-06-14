 # my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it.

It uses **ansible** to install packages and configure the system as I like :woman_technologist:

## Test the playbook with a virtual machine

![test diagram](test_with_vagrant.png)

#### Run the test
A Vagrantfile is prepared to test the playbook inside the VM that will be launched:

```
vagrant up # This will boot the Ubuntu virtual machine and run the playbook

vagrant provision # To rerun the playbook

vagrant destroy # To tear down the virtual machine
```

## Execute the playbook versus remote real hosts

![real hosts diagram](real_hosts.png)

#### Requirements :warning:

We rely on two users to provision:

- `ansible` user which will be the one used to provision. We will create it in both control and target node
- The user with which you have installed the Ubuntu OS. In these steps we will refer to it as `jdoe`

Following steps should be done:

- [Target node] Ubuntu OS is installed. `jdoe` user has been created as part of the normal installation
- [Target node] The script `target_node.sh` has run succesfully

- [Control node] The script `control_node.sh` has run succesfully

#### Run it

```
ansible-playbook playbook.yml -i hosts -u ansible -e user=jdoe
```

## Execute the playbook locally

![real hosts diagram](locally.png)

#### Requirements :warning:

Following steps should be done:

- [Local node] Ubuntu OS is installed. `jdoe` user has been created as part of the normal installation
- [Local node] The script `local_node.sh` has run succesfully

#### Run it

```
ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml  -e user=arcones
```

[![Build Status](https://travis-ci.org/arcones/my-DRP.svg?branch=master)](https://travis-ci.org/arcones/my-DRP)
