FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /root/.vnc; mkdir -p /noVNC/utils
COPY xstartup /root/.vnc
COPY launch.sh /noVNC/utils
COPY prepare_all.sh /
COPY prepare_negui.sh /
COPY run.sh run.sh

RUN bash prepare_all.sh

VOLUME /data



EXPOSE 22 5901 6080
CMD ./run.sh
