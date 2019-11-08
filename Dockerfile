FROM python:3.6-stretch

MAINTAINER OpenLab <openlab@iu.edu>

EXPOSE 42424/tcp
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update
RUN apt-get -y install sudo cmake gcc libaprutil1-dev lldpd libapr1-dev python-setuptools python-pip nodejs supervisor mongodb

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/osiris && \
    echo "osiris:x:${uid}:${gid}:OSIRIS,,,:/home/osiris:/bin/bash" >> /etc/passwd && \
    echo "osiris:x:${uid}:" >> /etc/group && \
    echo "osiris ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/osiris && \
    chmod 0440 /etc/sudoers.d/osiris && \
    chown ${uid}:${gid} -R /home/osiris && \
    chown ${uid}:${gid} -R /opt
    
USER osiris
ENV HOME /home/osiris
WORKDIR $HOME

RUN git config --global user.email "osiris@openlab"
RUN git config --global user.name "openlab"

RUN git clone -b osiris https://github.com/datalogistics/dlt-web

ADD build.sh .
RUN bash ./build.sh

ENV DEBUG DEBUG
ADD run.sh .
CMD bash ./run.sh
