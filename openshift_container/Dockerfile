FROM centos:latest

USER root

RUN yum -y install nano vim file man-db wget

ADD entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh"]
