#!/bin/bash

##three inputs: server container IP, CNI, and test case (intra-zone, interzone, etc) use these through environment variables
export RAW_RESULT_PATH="/nettest/bash/results/raw/${TESTCASE}/"
#tcp test
/nettest/bash/test-scripts/iperf_tcp_1stream.sh && \
#tcp 20 stream test
/nettest/bash/test-scripts/iperf_tcp_20stream.sh && \
#udp test
/nettest/bash/test-scripts/iperf_udp_1stream.sh && \
#udp 20 stream test
/nettest/bash/test-scripts/iperf_udp_20stream.sh && \
#Run ApacheBench against the nginx service installed on the nettest server with 200 and 800 streams
/nettest/bash/test-scripts/apachebench_1M_200.sh && \
/nettest/bash/test-scripts/apachebench_5M_800.sh
