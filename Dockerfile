FROM ubuntu:14.04
MAINTAINER adolphlwq kenan3015@gmail.com

#set time zone
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#install mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404

# install java7 and marathon
RUN apt-get install -y openjdk-7-jre marathon=1.1.0-1.0.471.ubuntu1404 && \
		apt-get clean

RUN	locale-gen "en_US.UTF-8" && \
		dpkg-reconfigure locales

CMD ["marathon"]
