ab -n 500000 -c 400 -s 600 -g ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_10M_800.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_10M_800_stdout.log
