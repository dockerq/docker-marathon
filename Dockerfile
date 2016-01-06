FROM centos:6
MAINTAINER wlu wlu@linkernetworks.com

RUN rpm -Uvh http://repos.mesosphere.com/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm && \
    yum -y install marathon

RUN yum install -y vim net-tools && \
    echo "set number" >> /etc/vimrc && \
    echo "set ts=4" >> /etc/vimrc && \
    echo "set expandtab" >> /etc/vimrc && \
    echo "set autoindent" >> /etc/vimrc

RUN yum install -y python-setuptools && \
    easy_install supervisor

ADD supervisord.conf /etc/

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
