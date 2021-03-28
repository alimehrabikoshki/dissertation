for testcase in "intrazone" "interzone" "interregion"
do
  echo "cni    Average Packets per second" > ../../results/results/tsv/${testcase}/iperf_udp_20stream_avg_pps_stats.tsv

done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_udp_20stream.log
  do
     echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep "receiver"  ${n} | awk '{print $7}')" >> ../../results/results/tsv/${testcase}/iperf_udp_20stream_avg_pps_stats.tsv
  done
done