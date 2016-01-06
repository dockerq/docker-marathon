FROM adolphlwq/ubuntu_jre8
MAINTAINER wlu wlu@linkernetworks.com

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
    DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') && \
    CODENAME=$(lsb_release -cs) && \
    echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" && \
    tee /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update && \
    apt-get -y install marathon

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
