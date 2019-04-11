FROM centos:latest

USER root

RUN yum -y install nano vim file man-db wget nss_wrapper gettext

ADD entrypoint.sh /usr/local/bin

ADD passwd.template /tmp/

RUN useradd -ms /bin/bash contestoc

USER contestoc

ADD .bashrc /home/contestoc/

ENTRYPOINT ["entrypoint.sh"]
