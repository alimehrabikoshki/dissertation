ab -n 100000 -c 250 -s 1200 -e ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_100K_250.log http://${SERVER_IP}:30080/ > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-apachebench_100K_250_stdout.log
