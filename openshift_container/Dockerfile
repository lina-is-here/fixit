FROM centos:latest

USER root

ENV test_var=1

RUN yum -y install nano vim file man-db wget

ADD entrypoint.sh /usr/local/bin

USER contestoc

ADD .bashrc /home/contestc

ENTRYPOINT ["entrypoint.sh"]
