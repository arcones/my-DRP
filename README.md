# my-DRP :woman_firefighter:

> DRP: :bomb: Disaster Recovery Plan :collision:

Personal script to configure any Debian/CentOS host to work with it. 
It uses **ansible** to install packages and configure the system as I like :woman_technologist:
For more info check directly the contents of `local-playbook.yml`

# Requirement :warning:
Ansible should be installed in your host. 

# Tests :whale:
There is a couple of Dockerfiles to build images that can be used to test the playbook without using it directly in your host.

You can build the image & run the container for CentOS with:

```
docker build -t my-drp-centos-test -f centos.Dockerfile . && docker run --network=host --rm my-drp-centos-test:latest --name my-drp-centos-test ansible-playbook local-playbook.yml
```

If it ends succesfully, the DRP script is working well on CentOS.

To test on Debian, just use `debian.Dockerfile` instea.

Also, a CircleCI build :arrows_counterclockwise: is configured to test the playbook in both containers.

# TODO :memo:
- Docker images, they should have base OS and ansible only (test in the same image with ansible ad-hoc ping versus localhost)
- CircleCI update with both tests (CentOS & Debian)
- Add raspbian docker image (for the raspis)
- Work on the playbook:
  - ssh setup for github
  - ssh setup for bitbucket (with conditional logic... split all job related to other play or even playbook? and run it conditionally?)
  - whiteboard list!
  - download personal & professional repos on usual dirs
  - rewrite system shutdown: autoremove, autoclean, empty trash bin, clean /tmp folder and any private data

# Roadmap :motorway:
- Create a packer :package: image at the end of the CircleCI build with my custom system ready to launch

