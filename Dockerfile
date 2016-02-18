FROM ubuntu:14.10
MAINTAINER wlu wlu@linkernetworks.com

ADD mesosphere.list /etc/apt/sources.list.d/mesosphere.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
	apt-get update

RUN apt-get install -y supervisor marathon=0.15.2-1.0.462.ubuntu1404

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
