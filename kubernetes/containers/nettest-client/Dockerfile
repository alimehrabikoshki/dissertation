FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
      apt-get -y install iperf3 wget curl apache2-utils rsync sed


WORKDIR /nettest
#COPY run_tests.sh /nettest/run_tests.sh
