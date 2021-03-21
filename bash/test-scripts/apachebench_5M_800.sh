ab -n 5000000 -c 800 -s 1200 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_5M_800.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_5M_800_stdout.log
