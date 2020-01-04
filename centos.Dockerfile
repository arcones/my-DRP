FROM centos:latest

LABEL maintainer="marta.arcones@gmail.com"

RUN yum update -y && yum install -y python3-pip && pip3 install ansible 

COPY local-playbook.yml .

CMD ansible localhost -m ping
