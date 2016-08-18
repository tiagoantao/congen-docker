FROM continuumio/anaconda3
MAINTAINER tiagoantao@gmail.com

RUN conda update --all
RUN conda config --add channels bioconda
RUN conda config --add channels r


RUN conda install -y bwa samtools picard
RUN conda install -y vcftools plink

RUN conda install -y stacks

