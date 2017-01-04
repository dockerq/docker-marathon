FROM ubuntu:16.04
MAINTAINER adolphlwq kenan3015@gmail.com

RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN echo "deb http://repos.mesosphere.com/ubuntu xenial main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
	apt-get update

RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y marathon=0.15.2-1.0.462.ubuntu1404 mesos=0.26.0-0.2.145.ubuntu1404

#fix lang error
RUN locale-gen "en_US.UTF-8" && \
	dpkg-reconfigure locales
