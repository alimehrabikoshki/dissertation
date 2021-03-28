for testcase in "intrazone" "interzone" "interregion"
do
  gnuplot -c iperf_tcp_1stream_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_1stream_retransmissions.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_retransmissions.gp ${testcase}
  gnuplot -c iperf_udp_1stream_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_1stream_packetloss.gp ${testcase}
  gnuplot -c iperf_udp_20stream_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_20stream_packetloss.gp ${testcase}
done
