FROM ubuntu:latest

RUN apt-get update && apt-get install -y iperf3 wget flowgrind rrdtool nginx
RUN ufw disable
RUN systemctl start nginx; systemctl enable nginx
EXPOSE 5201/tcp 5201/udp 80/tcp 443/tcp

ENTRYPOINT ["iperf3"]