FROM ubuntu:14.04

MAINTAINER Chet Printhong

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install libstdc++5:i386 curl -y

RUN mkdir /app
WORKDIR /app

RUN curl -O http://download.sopcast.com/download/sp-auth.tgz
RUN tar -xf sp-auth.tgz

ADD docker-entrypoint.sh /

EXPOSE 8902

ENTRYPOINT ["/docker-entrypoint.sh"]
