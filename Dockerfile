FROM ubuntu:latest

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

COPY setup.sh setup.sh
COPY .vimrc .vimrc

ENTRYPOINT ["./setup.sh"]
CMD ["auto"]

