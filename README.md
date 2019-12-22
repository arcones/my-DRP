# my-DRP

> DRP: Disaster Recovery Plan

Personal script to configure any Debian host to work with it. It installs libs, applications, and configure some of them. For more info check directly the code of it in `setup.sh`

# Requirement
The script should be run with `sudo`

# Test
There is a Dockerfile to build an image that can be used to test the script without using it directly in your host.

You can build the image & run the container with:
`docker build -f test/Dockerfile -t my-drp-test . && docker run --network=host --rm my-drp-test:latest --name my-drp-test`

If it ends succesfully, the DRP script is working well.

# Watch out
The script does some clean up task that include removing and/or overwritting files, use it at your own risk!
