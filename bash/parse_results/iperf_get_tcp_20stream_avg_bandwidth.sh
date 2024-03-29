for testcase in "intrazone" "interzone" "interregion"
do
  echo "cni    Average Throughput" > ../../results/results/tsv/${testcase}/iperf_tcp_20stream_avg_bandwidth_stats.tsv

done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_tcp_20stream.log
  do
     echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep "receiver"  ${n} | grep "SUM" | awk '{print $6}')" >> ../../results/results/tsv/${testcase}/iperf_tcp_20stream_avg_bandwidth_stats.tsv
  done
done