FROM centos:centos6
MAINTAINER Migiel <migiel@surfnet.nl>

RUN yum -y update; yum clean all
RUN yum -y install traceroute mc net-tools ntp python-setuptools
#RUN easy_install supervisor
RUN rpm -hUv https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -hUv http://software.internet2.edu/rpms/el6/x86_64/main/RPMS/Internet2-repo-0.6-1.noarch.rpm
RUN yum clean all
RUN yum -y install perfsonar-toolkit
RUN yum -y install perfsonar-centralmanagement
#RUN mkdir -p /var/log/supervisor
#ADD supervisord.conf /etc/supervisord.conf
ADD start.sh /usr/local/bin/start.sh
ADD lsregistrationdaemon.conf /etc/perfsonar/lsregistrationdaemon.conf
VOLUME /var/run
#CMD /usr/bin/supervisord -c /etc/supervisord.conf
#CMD bash -C '/usr/local/bin/start.sh';'/bin/bash';'waaa'
#CMD /bin/sh -c "/usr/local/bin/start.sh && /bin/bash"
ENTRYPOINT /usr/local/bin/start.sh && bash
