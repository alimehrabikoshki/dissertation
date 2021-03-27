ab -n 200000 -c 500 -s 1200 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_200K_500.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_200K_500_stdout.log
