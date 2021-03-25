ab -n 200000 -c 500 -s 1200 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_800K_400.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_800K_400_stdout.log
