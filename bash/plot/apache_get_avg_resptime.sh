echo "cni    Avg Response Time" > ../results/tsv/*/apache_avg_resptime_stats.tsv
for testcase in ["intrazone" "interzone" "interregion"]
do
  for test in ["5M_800" "1M_200"]
  do
    for n in ../results/raw/${testcase}/*{test}_stdout.log
    do
       echo "$(echo ${n} |  cut -d '-' -f1)    $(grep -v "across all concurrent requests" ${n}| grep "Time per request:" |  sed 's/[#\/sec] (mean)//g' |  sed 's/Time per request://g')" >> ../results/tsv/*/apache_avg_resptime_stats.tsv
    done
  done
done