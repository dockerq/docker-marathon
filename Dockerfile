FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

ADD sources.list /etc/apt/sources.list
ADD mesosphere.list /etc/apt/sources.list.d/mesosphere.list

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
	apt-get update

RUN apt-get install -y python-setuptools marathon && \
    easy_install supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
