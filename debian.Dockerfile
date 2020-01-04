FROM ubuntu:latest

LABEL maintainer="marta.arcones@gmail.com"

RUN apt update -y && apt install -y python3-pip && pip3 install ansible 

COPY local-playbook.yml .

CMD ansible localhost -m ping
