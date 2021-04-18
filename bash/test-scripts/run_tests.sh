#!/bin/bash
export RAW_RESULT_PATH="/nettest/bash/results/raw/${TESTCASE}/"
/nettest/bash/test-scripts/iperf_tcp_1stream.sh && \
/nettest/bash/test-scripts/iperf_tcp_20stream.sh && \
/nettest/bash/test-scripts/iperf_udp_1stream.sh && \
/nettest/bash/test-scripts/iperf_udp_20stream.sh && \
/nettest/bash/test-scripts/apachebench_100K_250.sh && \
/nettest/bash/test-scripts/apachebench_200K_500.sh
