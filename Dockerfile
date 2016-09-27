FROM debian:7

MAINTAINER Chet Printhong

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install libstdc++5:i386 wget -y

RUN mkdir /app
WORKDIR /app

RUN wget http://download.sopcast.com/download/sp-auth.tgz && apt-get remove wget -y
RUN tar -xf sp-auth.tgz

ADD docker-entrypoint.sh /

EXPOSE 8902

ENTRYPOINT ["/docker-entrypoint.sh"]
