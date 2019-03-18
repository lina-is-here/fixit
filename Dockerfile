FROM centos:latest
RUN yum -y install git python-pip gcc python-setuptools && \
    yum clean all


RUN easy_install pip
RUN pip install -U virtualenv

ADD entrypoint.sh /usr/local/bin

RUN adduser contest
USER contest
WORKDIR /home/contest

RUN git clone https://github.com/lina-nikiforova/fixit
WORKDIR /home/contest/fixit
RUN virtualenv .contest_venv

RUN source .contest_venv/bin/activate && \
    PYCURL_SSL_LIBRARY=nss pip install -r ./requirements.txt

RUN echo 'source /home/contest/fixit/.contest_venv/bin/activate' >> ~/.bashrc

VOLUME /home/contest/volume

ENTRYPOINT ["entrypoint.sh"]
