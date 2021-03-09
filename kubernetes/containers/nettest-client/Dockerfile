FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf3 wget flowgrind rrdtool curl apache2-utils

WORKDIR /nettest
COPY run_test.sh /nettest/run_test.sh
RUN chmod 777 /nettest/run_test.sh
