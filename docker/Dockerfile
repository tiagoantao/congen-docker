FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y xfce4 vnc4server
RUN apt-get install -y build-essential zlib1g-dev libgsl0-dev
RUN apt-get install -y unzip
RUN apt-get install -y firefox-esr

RUN conda update --all
RUN conda config --add channels bioconda
RUN conda config --add channels r


RUN conda install -y bwa samtools picard
RUN conda install -y vcftools plink2
RUN conda install -y stacks


RUN git clone --recursive https://github.com/mfumagalli/ngsTools.git
WORKDIR ngsTools
RUN make
WORKDIR /


#RUN git clone https://github.com/angsd/angsd.git
#WORKDIR angsd
#RUN make
#WORKDIR /


RUN wget http://www.mstmap.org/MSTMap.source.tar.gz
RUN tar zxf MSTMap.source.tar.gz
WORKDIR /MSTMap
RUN make
WORKDIR /

RUN wget https://sourceforge.net/projects/lepmap2/files/binary%2Bcode.zip/download -O bincode.zip
RUN mkdir /bincode
WORKDIR /bincode
RUN unzip ../bincode
WORKDIR /



RUN mkdir /root/.vnc
COPY xstartup /root/.vnc
COPY passwd /root/.vnc
RUN chmod a+x /root/.vnc/xstartup

RUN git clone https://github.com/kanaka/noVNC.git
WORKDIR noVNC
RUN git clone https://github.com/kanaka/websockify
WORKDIR /

RUN mkdir /data
VOLUME /data

COPY run.sh run.sh
RUN chmod a+x run.sh

EXPOSE 5901 80
CMD run.sh
