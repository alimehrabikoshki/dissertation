for testcase in "intrazone" "interzone" "interregion"
do
  gnuplot -c iperf_tcp_1stream_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_1stream_retransmissions.gp ${testcase}
  gnuplot -c iperf_tcp_1stream_avg_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_1stream_avg_retransmissions.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_retransmissions.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_avg_throughput.gp ${testcase}
  gnuplot -c iperf_tcp_20stream_avg_retransmissions.gp ${testcase}
  gnuplot -c iperf_udp_1stream_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_1stream_packetloss.gp ${testcase}
  gnuplot -c iperf_udp_1stream_avg_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_20stream_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_20stream_avg_packetspersecond.gp ${testcase}
  gnuplot -c iperf_udp_20stream_packetloss.gp ${testcase}
  gnuplot -c apache_100K_250_avg_resptime.gp ${testcase}
  gnuplot -c apache_100K_250_percentiles.gp ${testcase}
  gnuplot -c apache_100K_250_rps.gp ${testcase}
  gnuplot -c apache_200K_500_avg_resptime.gp ${testcase}
  gnuplot -c apache_200K_500_percentiles.gp ${testcase}
  gnuplot -c apache_200K_500_rps.gp ${testcase}
done
