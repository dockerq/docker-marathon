FROM java:openjdk-8u72-jre
MAINTAINER adolphlwq kenan3015@gmail.com

#set time zone
RUN ln -f -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#install mesos
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404

# install java8 and marathon
#RUN apt-get install -y openjdk-8-jre
#RUN apt-get install -y -f install
RUN apt-get install -y marathon=0.15.3-1.0.463.ubuntu104 && \
		apt-get clean

RUN	locale-gen "en_US.UTF-8" && \
		dpkg-reconfigure locales

CMD ["marathon"]
