for testcase in "intrazone" "interzone" "interregion"
do
  echo "cni    Packet Loss (%)" > ../../results/results/tsv/${testcase}/iperf_udp_20stream_packetloss_stats.tsv
done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_udp_20stream.log
  do
     echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep "receiver" ${n}| awk -F " " '{print $12}'| awk -F"[()]" '{print $2}')" >> ../../results/results/tsv/${testcase}/iperf_udp_20stream_packetloss_stats.tsv
  done
done