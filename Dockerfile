FROM adolphlwq/ubuntu_jre8
MAINTAINER wlu wlu@linkernetworks.com

RUN wget http://downloads.mesosphere.com/marathon/v0.13.0/marathon-0.13.0.tgz | tar xvf -C /usr/local

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
