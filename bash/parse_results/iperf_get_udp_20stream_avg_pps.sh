for testcase in "intrazone" "interzone" "interregion"
do
  echo "cni    Average Packets per second" > ../../results/results/tsv/${testcase}/iperf_udp_20stream_avg_pps_stats.tsv
done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_udp_20stream.log
  do
    PACKETS=$(grep "receiver"  ${n} |  grep "SUM" | awk '{print $10}'| cut -d "/" -f2)
    PPS=$(echo "${PACKETS} / 60" | bc -l)
    echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    ${PPS}" >> ../../results/results/tsv/${testcase}/iperf_udp_20stream_avg_pps_stats.tsv
  done
done