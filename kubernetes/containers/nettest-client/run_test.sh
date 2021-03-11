#!/bin/bash
#three inputs: server container IP, CNI, and test case (intra-zone, interzone, etc) use these through environment variables

#tcp test
iperf3 --client ${SERVER_IP} -p 30000 -t 20 --set-mss 1460 -i 1 -f m  > ${CNI}-${TESTCASE}-iperf_tcp_1stream.log
#tcp 8 stream test
iperf3 --client ${SERVER_IP} -p 30000 -t 20 --set-mss 1460 -i 1 -f m  -P 8 > ${CNI}-${TESTCASE}-iperf_tcp_8stream.log
#udp test
iperf3 --client ${SERVER_IP} -p 30000 -t 20  -u -b 32000000000 -i 1 -f m  > ${CNI}-${TESTCASE}-iperf_udp.log
#Run ApacheBench against the nginx service installed on the nettest server with 10 streams
ab -n 100000 -c 20 -g ${CNI}-${TESTCASE}-apachebench_10stream.log http://${SERVER_IP}:30080/
#Run ApacheBench against the nginx service installed on the nettest server with 50 streams
ab -n 1000000 -c 200 -g ${CNI}-${TESTCASE}-apachebench_50stream.log http://${SERVER_IP}:30080/
