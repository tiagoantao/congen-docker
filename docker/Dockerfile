FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y xfce4 vnc4server
RUN apt-get install -y build-essential zlib1g-dev libgsl0-dev
RUN apt-get install -y unzip tmux screen
RUN apt-get install -y firefox-esr
RUN apt-get install -y net-tools

RUN conda update --all
RUN conda config --add channels bioconda
RUN conda config --add channels r


RUN conda install -y bwa samtools picard
RUN conda install -y vcftools plink2
RUN conda install -y stacks

RUN mkdir /var/run/sshd
RUN ssh-keygen -A
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN echo "root:congen17" | chpasswd
RUN echo PasswordAuthentication yes >> /etc/ssh/sshd_config


RUN mkdir /root/.vnc
RUN echo congen17 > pass; echo congen17 >> pass; vncpasswd < pass; rm pass
COPY xstartup /root/.vnc
RUN chmod a+x /root/.vnc/xstartup

RUN git clone https://github.com/kanaka/noVNC.git
COPY launch.sh /noVNC/utils
WORKDIR /noVNC
RUN cp vnc.html index.html
WORKDIR /noVNC/utils
RUN git clone https://github.com/kanaka/websockify
WORKDIR /

RUN conda create -n python2 python=2
COPY prepare_negui.sh /
RUN chmod a+x prepare_negui.sh
RUN ./prepare_negui.sh
RUN git clone https://github.com/popgengui/negui.git

RUN conda install -y r r-vegan
RUN conda install -y bioconductor-qvalue

RUN echo "source('https://bioconductor.org/biocLite.R')\nbiocLite('LEA')" > R.inst
RUN echo "install.packages('RepeatABEL', repos='http://cran.us.r-project.org')" >>R.inst
RUN R --no-save < R.inst



RUN mkdir /data
VOLUME /data


COPY run.sh run.sh
RUN chmod a+x run.sh


EXPOSE 5901 6080
CMD ./run.sh
