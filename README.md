# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it.

It uses **ansible** to install packages and configure the system as I like :woman_technologist:

## Requirements :warning:

- Target host should be an Ubuntu OS
- It is assumed that user `arcones` is already created in the target host
- When running ansible remotely, only `python3-pip python3-apt` are required (Recommended)
- When running ansible locally, `ansible` package is also required

## Execute this playbook
```
ansible-playbook playbook.yml -i inventory -u arcones
```

Also, a TravisCI build is triggered on each push, its current `status` on master branch is [![Build Status](https://travis-ci.org/arcones/my-DRP.svg?branch=master)](https://travis-ci.org/arcones/my-DRP)

## TODO
- Missing tools: terraform & tfenv, apache directory studio
- Missing config: ssh config, repositories, motd, minimum version of zsh history, customize tray
- Missing: set nice failed_when, changed_when, etc on shell like modules, normalize registers/checks sytnax, check with Vagrant, ansible-lint
