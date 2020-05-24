FROM ubuntu:20.04

LABEL maintainer="marta.arcones@gmail.com"

RUN apt update -y && apt install -y python3-pip && pip3 install ansible

COPY inventory playbook.yml roles ./

CMD ansible localhost -m ping
