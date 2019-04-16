FROM centos:latest

RUN yum -y install git python-pip gcc python-setuptools tmux bash-completion zip unzip vim-enhanced nano file man-db curl wget && \
    yum clean all


COPY detect_passed /usr/local/bin
RUN easy_install pip
RUN pip install -U virtualenv

RUN adduser contest
USER contest

# Install all content here
WORKDIR /home/contest

# Opesnhift client
RUN curl -L -O https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
    tar -xvzf ./openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
ENV PATH=${PATH}:/home/contest/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit

# Clone repos
RUN git clone https://github.com/lina-nikiforova/fixit fixit-base/
# ADD ./* fixit-base/
RUN git clone https://github.com/aegirhall/console-menu

ADD 0001-allow-new-lines-in-menu-text.patch /tmp
RUN cd console-menu && git apply -v /tmp/*.patch

RUN mkdir /home/contest/fixit
WORKDIR /home/contest/fixit

# Install virtual env
RUN ls -ltr /home/contest && virtualenv .contest_venv
RUN source .contest_venv/bin/activate && \
    PYCURL_SSL_LIBRARY=nss pip install -r ../fixit-base/requirements.txt && \
    pip install /home/contest/console-menu/ && \
    pip install pyinstaller pacman-game \
    && pyinstaller ../fixit-base/contest && ls -ltr && ls -ltr dist/

RUN echo 'source /home/contest/fixit/.contest_venv/bin/activate' >> ~/.bashrc && \
    echo 'alias pytest='/usr/local/bin/detect_passed >> ~/.bashrc

ADD .tmux.conf /home/contest/
ADD entrypoint.sh /usr/local/bin


USER root
RUN oc completion bash >> /etc/bash_completion.d/oc_completion && \
    cat /home/contest/fixit-base/bash_oc_function >> /home/contest/.bashrc

# chmod 700 /home/contest/fixit-base && chown root:root /home/contest/fixit-base

USER contest
RUN ln -s /home/contest/fixit-base/contest /home/contest/fixit/contest && \
    cp /home/contest/fixit-base/centos_pods.yml /home/contest/fixit/ && \
    cp -pr /home/contest/fixit-base/files /home/contest/fixit/

VOLUME /home/contest/volume

ENTRYPOINT ["entrypoint.sh"]
