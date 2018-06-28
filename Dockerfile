FROM ubuntu:18.04

RUN apt-get update -y && apt-get -y install apt-utils && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && apt-get -y install mumble-server libssl1.0.0 && \
 apt-get autoremove && apt-get clean

ADD ./mumble-server.ini /etc/mumble-server.ini

EXPOSE 64738/udp
EXPOSE 64738/tcp

CMD service mumble-server start
