FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /root/.vnc
COPY xstartup /root/.vnc
COPY prepare_all.sh /
COPY prepare_negui.sh /
COPY run.sh run.sh
RUN bash prepare_all.sh
COPY launch.sh /noVNC/utils

VOLUME /data



EXPOSE 22 5901 6080
CMD ./run.sh
