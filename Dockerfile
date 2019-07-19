# 镜像源
FROM rocker/r-base

#作者
MAINTAINER Pharbers Liu <contact@pharbershub>

#LABEL
LABEL 	UcbPods.version="2.0.0" maintainer="Liu"

#下载依赖
RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libcurl4-nss-dev
RUN apt-get install -y libcurl4-gnutls-dev

RUN apt-get install -y libssl-dev libsasl2-dev
RUN R -e 'install.packages("plyr", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("dplyr", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("tidyr", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("DT", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("jsonlite", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("curl", repos = "http://cran.cnr.berkeley.edu/")'
RUN R -e 'install.packages("uuid", repos = "http://cran.cnr.berkeley.edu/")'

COPY ./Functions.R /Functions.R
COPY ./Kafka.R /Kafka.R
COPY ./Calculation.R /Calculation.R
COPY ./Main.R /Main.R

CMD Rscript ./Main.R
