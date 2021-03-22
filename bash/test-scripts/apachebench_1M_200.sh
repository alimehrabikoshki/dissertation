ab -n 200000 -c 1000 -s 1200 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_400K_200.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_400K_200_stdout.log
