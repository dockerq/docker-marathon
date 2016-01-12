FROM adolphlwq/ubuntu_jre8
MAINTAINER wlu wlu@linkernetworks.com

RUN wget http://downloads.mesosphere.com/marathon/v0.13.0/marathon-0.13.0.tgz && \
    tar xvf marathon-0.13.0.tgz -C /usr/local && \
    rm marathon-0.13.0.tgz

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get -y update && \
    apt-get -y install mesos

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
