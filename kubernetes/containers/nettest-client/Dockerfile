FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf3 wget flowgrind rrdtool curl

WORKDIR /nettest
COPY ../../../bash/run_test.sh /nettest/run_test.sh

