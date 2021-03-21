iperf3 --client ${SERVER_IP} -p 30000 -t 60  -u -b 32000000000 -i 1 -f m  > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-iperf_udp_1stream.log
