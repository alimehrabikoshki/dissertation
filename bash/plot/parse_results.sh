#!/usr/bin/env bash
#Parse apache results
./apache_get_percentiles.sh &&  \
./apache_get_avg_resptime.sh  && \
./apache_get_rps.sh && \

#Parse iperf results
./iperf_get_tcp_20stream_bandwidth.sh && \
./iperf_get_udp_1stream_pps.sh  && \
./iperf_get_tcp_1stream_bandwidth.sh && \
./iperf_get_tcp_20stream_retransmissions.sh  && \
./iperf_get_udp_20stream_packetloss.sh  &&  \
./iperf_get_tcp_1stream_retransmissions.sh &&  \
./iperf_get_udp_1stream_packetloss.sh && \
./iperf_get_udp_20stream_pps.sh
