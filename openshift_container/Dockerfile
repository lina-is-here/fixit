FROM centos:latest

USER root

ADD .bashrc /

# RUN  curl -o http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
#      rpm -ivh epel-release-latest-7.noarch.rpm

RUN PACKAGES="nss_wrapper gettext epel-release" && \
    yum install -y centos-release-scl && \
    yum install -y --enablerepo=centosplus $PACKAGES && \
    rpm -V $PACKAGES && \
    yum clean all -y

ADD entrypoint.sh /usr/local/bin

ADD passwd.template /tmp/

RUN useradd -ms /bin/bash contestoc

USER 1000

ADD .bashrc /home/contestoc/

ENTRYPOINT ["entrypoint.sh"]
