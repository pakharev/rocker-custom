FROM rocker/tidyverse:4.4.0

LABEL author="alekseipakharev"

RUN apt-get update
RUN apt-get install -y git wget unzip
RUN apt-get install -y libxt-dev libbz2-dev liblzma-dev libglpk40 libhdf5-dev

USER root
