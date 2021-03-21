ab -n 1000000 -c 200 -s 600 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_1M_200.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_1M_200_stdout.log
