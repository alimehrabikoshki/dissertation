#!/bin/bash
#three inputs: server container IP, CNI, and test case (intra-zone, interzone, etc) use these through environment variables

#tcp test
iperf3 --client ${SERVER_IP} -p 30000 -t 20 --set-mss 1460 -i 1 -f m  --logfile ${CNI}-${TESTCASE}-iperf_tcp_1stream.log
#tcp 8 stream test
iperf3 --client ${SERVER_IP} -p 30000 -t 20 --set-mss 1460 -i 1 -f m  -P 8 --logfile ${CNI}-${TESTCASE}-iperf_tcp_8stream.log
#udp test (TODO:change max bandwidth to 32gbps once all is done)
iperf3 --client ${SERVER_IP} -p 30000 -t 20 --set-mss 32 -u -b 32000000000 -i 1 -f m  --logfile ${CNI}-${TESTCASE}-iperf_udp.log
#Run ApacheBench against the nginx service installed on the nettest server with 10 streams
ab -n 10000 -c 10 -e ${CNI}-${TESTCASE}-apachebench_10stream.log http://${SERVER_IP}:30080/
#Run ApacheBench against the nginx service installed on the nettest server with 50 streams
ab -n 50000 -c 50 -e ${CNI}-${TESTCASE}-apachebench_50stream.log http://${SERVER_IP}:30080/
