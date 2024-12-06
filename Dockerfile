FROM rocker/tidyverse:4.4.2

LABEL author="alekseipakharev"

RUN apt-get update
RUN apt-get install -y git wget unzip curl gpg
RUN curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
RUN install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg
RUN gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list
RUN apt-get update
RUN apt-get install -y conda
RUN apt-get install -y libxt-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y liblzma-dev
RUN apt-get install -y libglpk40
RUN apt-get install -y libhdf5-dev

RUN echo '.libPaths(c("/user-library", .libPaths()))' >> /usr/local/lib/R/etc/Rprofile.site

USER root
