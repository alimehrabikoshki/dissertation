FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y iperf3 \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://golang.org/dl/go1.16.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin
#    && source $HOME/.profile.
EXPOSE 5201