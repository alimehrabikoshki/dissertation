#!/bin/bash
#three inputs: server container IP, CNI, and test case (intra-zone, interzone, etc) use these through environment variables

#tcp test
iperf3 --client ${SERVER_IP} -t 60 --set-mss 1460 -i 1 -f m -J --logfile ${CNI}-${TESTCASE}-iperf_tcp_1stream.log
#tcp 8 stream test
iperf3 --client ${SERVER_IP} -t 60 --set-mss 1460 -i 1 -f m -J -P 8 --logfile ${CNI}-${TESTCASE}-iperf_tcp_8stream.log
#udp test (change max bandwidth to 32gbps once all is done)
iperf3 --client ${SERVER_IP} -t 60 --set-mss 32 -u -b 1600000000 -i 1 -f m -J --logfile ${CNI}-${TESTCASE}-iperf_udp.log
#Run ApacheBench against the nginx service installed on the nettest server
ab -n 10000 -c 10 -e ${CNI}-${TESTCASE}-apachebench_10stream.log
#Run ApacheBench against the nginx service installed on the nettest server
ab -n 50000 -c 50 -e ${CNI}-${TESTCASE}-apachebench_50stream.log