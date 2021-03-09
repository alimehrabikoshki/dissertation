#!/bin/bash
#three inputs: server container IP, CNI, and test case (intra-zone, interzone, etc) use these through environment variables

#tcp test
iperf3 --client ${SERVER_IP} -t 60 --set-mss 1460 --logfile ${CNI}-${TESTCASE}-iperf_tcp.log -i 1 -f m -J
#udp test
iperf3 --client ${SERVER_IP} -t 60 --set-mss 32 -u -b 1600000000 --logfile ${CNI}-${TESTCASE}-iperf_udp.log -i 1 -f m -J
