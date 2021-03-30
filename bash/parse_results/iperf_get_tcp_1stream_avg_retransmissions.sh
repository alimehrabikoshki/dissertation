for testcase in "intrazone" "interzone" "interregion"
do
  echo "cni    Average Retransmissions" > ../../results/results/tsv/${testcase}/iperf_tcp_1stream_avg_retransmissions_stats.tsv

done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_tcp_1stream.log
  do
     echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep "sender"  ${n} | awk '{print $7}')" >> ../../results/results/tsv/${testcase}/iperf_tcp_1stream_avg_retransmissions_stats.tsv
  done
done