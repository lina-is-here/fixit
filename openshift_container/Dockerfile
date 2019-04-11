FROM centos:latest

USER root

RUN  curl -o http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
     rpm -ivh epel-release-latest-7.noarch.rpm

RUN yum -y install nano vim file man-db wget nss_wrapper gettext

ADD entrypoint.sh /usr/local/bin

ADD passwd.template /tmp/

RUN useradd -ms /bin/bash contestoc

USER contestoc

ADD .bashrc /home/contestoc/

ENTRYPOINT ["entrypoint.sh"]
