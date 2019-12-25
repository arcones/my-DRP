# my-DRP

> DRP: Disaster Recovery Plan

Personal script to configure any Debian host to work with it. It installs libs, applications, and configure some of them. For more info check directly the code of it in `setup.sh`

# Modes
 - `auto`: Will not ask for confirmation on the installation of certain programs. Some software will not be installed.
 - `managed`: Will install the same software as auto and also some additional software if confirmed by user input.

# Test
There is a Dockerfile to build an image that can be used to test the script without using it directly in your host.

You can build the image & run the container with:

```
docker build -t my-drp-test . && docker run --network=host --rm my-drp-test:latest --name my-drp-test
```

If it ends succesfully, the DRP script is working well.

You can easily override the `auto` mode by passing the proper argument to the `docker run` call, like in this example...:

```
docker run --network=host --rm my-drp-test:latest --name my-drp-test managed
```

...where `managed` will be the mode used.

Also, a CircleCI build is configured to test the script with docker.

# Watch out
The script does some clean up task that include removing and/or overwritting files, use it at your own risk!
