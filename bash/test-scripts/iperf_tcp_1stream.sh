iperf3 --client ${SERVER_IP} -p 30000 -t 60 --set-mss 1460 -i 1 -f m -C cubic  > ${RAW_RESULT_PATH}${CNI}-${TESTCASE}-iperf_tcp_1stream.log

###
# Time        UID       PID    %usr %system  %guest   %wait    %CPU   CPU  minflt/s  majflt/s     VSZ     RSS   %MEM  Command
#16:33:36     1000     11454    0.00    0.00    0.00    0.00    0.00     7      0.00      0.00   10412    1232   0.00  iperf3