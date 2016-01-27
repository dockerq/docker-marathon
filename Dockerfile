FROM centos:7
MAINTAINER wlu wlu@linkernetworks.com

RUN yum -y update && \
    rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    yum -y install marathon-0.13.0 mesos-0.26.0 iproute.x86_64

RUN yum install -y python-setuptools && \
    easy_install supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
