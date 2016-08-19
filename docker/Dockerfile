FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

RUN conda update --all
RUN conda config --add channels bioconda
RUN conda config --add channels r


RUN conda install -y bwa samtools picard
RUN conda install -y vcftools plink2
RUN conda install -y stacks


RUN git clone --recursive https://github.com/mfumagalli/ngsTools.git
RUN apt-get install -y build-essential zlib1g-dev libgsl0-dev
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

RUN apt-get install unzip
RUN wget https://sourceforge.net/projects/lepmap2/files/binary%2Bcode.zip/download -O bincode.zip
RUN mkdir /bincode
WORKDIR /bincode
RUN unzip ../bincode


RUN mkdir /data


VOLUME /data
