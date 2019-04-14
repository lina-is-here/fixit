FROM centos:latest
RUN yum -y install git python-pip gcc python-setuptools tmux bash-completion zip unzip vim-enhanced nano file man-db curl wget && \
    yum clean all


RUN easy_install pip
RUN pip install -U virtualenv
RUN pip install pacman-game

ADD entrypoint.sh /usr/local/bin
COPY detect_passed /usr/local/bin

RUN adduser contest
USER contest
WORKDIR /home/contest

RUN git clone https://github.com/lina-nikiforova/fixit
RUN git clone https://github.com/aegirhall/console-menu
ADD 0001-allow-new-lines-in-menu-text.patch /tmp
RUN cd console-menu && git apply -v /tmp/*.patch


WORKDIR /home/contest/fixit

RUN virtualenv .contest_venv

RUN source .contest_venv/bin/activate && \
    PYCURL_SSL_LIBRARY=nss pip install -r ./requirements.txt && \
    pip install /home/contest/console-menu/

RUN echo 'source /home/contest/fixit/.contest_venv/bin/activate' >> ~/.bashrc

RUN curl -L -O https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
    tar -xvzf ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

ENV PATH=${PATH}:/home/contest/fixit/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit

ADD .tmux.conf /home/contest/

USER root
RUN oc completion bash >> /etc/bash_completion.d/oc_completion && \
    cat /home/contest/fixit/bash_oc_function >> /home/contest/.bashrc
USER contest

VOLUME /home/contest/volume

ENTRYPOINT ["entrypoint.sh"]
