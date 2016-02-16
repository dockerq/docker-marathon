FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
	echo "deb http://repos.mesosphere.com/ubuntu trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
	apt-get -y update && \
    apt-get -y install mesos marathon

RUN yum install -y python-setuptools && \
    easy_install supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
