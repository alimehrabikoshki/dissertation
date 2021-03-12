FROM ubuntu:latest



RUN  apt-get update &&  apt-get install -y iperf3 wget nginx
EXPOSE 5201/tcp 5201/udp 80/tcp 443/tcp

WORKDIR /nettest
COPY start_services.sh /nettest/start_services.sh
RUN chmod 777 /nettest/start_services.sh

CMD ["tail",  "-f", "/dev/null"]
