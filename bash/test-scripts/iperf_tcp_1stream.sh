iperf3 --client ${SERVER_IP} -p 30000 -t 60  -i 1 -f m   > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-iperf_tcp_1stream.log
