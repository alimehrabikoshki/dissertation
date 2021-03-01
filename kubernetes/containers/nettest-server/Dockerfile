FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf3 wget flowgrind rrdtool

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]