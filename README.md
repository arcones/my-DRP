# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it.

It uses **ansible** to install packages and configure the system as I like :woman_technologist:

## Requirement :warning:
Ansible should be working in the host.

## Execute this playbook
```
ansible-playbook playbook.yml --diff
```
## Tests :whale:
There is a Dockerfile to build an image that can be used to test the playbook without using it directly in your host.

You can build the image & run the container with:

```
docker build -t my-drp-ubuntu-test . && \
docker run my-drp-ubuntu-test:latest ansible-playbook -i inventory playbook.yml
```

If it ends succesfully, the DRP playbook is working well.

Also, a TravisCI build is triggered on each push, its current `status` on master branch is [![Build Status](https://travis-ci.org/arcones/my-DRP.svg?branch=master)](https://travis-ci.org/arcones/my-DRP)

## TODO
- Missing tools: globalprotect client, terraform & tfenv, mpr, miniconda, python3
- Missing config: conda base yml
