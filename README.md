# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure an Ubuntu host to work with it. 
It uses **ansible** to install packages and configure the system as I like :woman_technologist:
For more info check directly the contents of `DRP.yml`

# Requirement :warning:
Ansible should be working in the host. 

# Test :whale:
There is a Dockerfile to build an image that can be used to test the playbook without using it directly in your host.

You can build the image & run the container with:

```
docker build -t my-drp-ubuntu-test -f ubuntu.Dockerfile . && docker run my-drp-ubuntu-test:latest ansible-playbook DRP.yml 
```

If it ends succesfully, the DRP playbook is working well.

Also, a CircleCI build :arrows_counterclockwise: is configured to test the playbook in the container on each push.
Its current status is [![CircleCI](https://circleci.com/gh/arcones/my-DRP.svg?style=svg)](https://circleci.com/gh/arcones/my-DRP)

# TODO :memo:
- Docker images, they should have base OS and ansible only (test in the same image with ansible ad-hoc ping versus DRPhost)
- CircleCI update with both tests (CentOS & Debian)
- Add raspbian docker image (for the raspis)
- Work on the playbook:
  - ssh setup for github
  - ssh setup for bitbucket (with conditional logic... split all job related to other play or even playbook? and run it conditionally?)
  - whiteboard list! fdupes, old bash script ideas, etc
  - download personal & professional repos on usual dirs
  - rewrite system shutdown: autoremove, autoclean, empty trash bin, clean /tmp folder and any private data
  - plain execution in CI using as hosts the docker images (not need to rebuild them), just to test with an inventory

# Roadmap :motorway:
- Create a packer :package: image at the end of the CircleCI build with my custom system ready to launch

