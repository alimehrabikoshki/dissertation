iperf3 --client ${SERVER_IP} -p 30000 -t 60 --set-mss 1460 -i 1 -f m  -P 20 > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-iperf_tcp_8stream.log
