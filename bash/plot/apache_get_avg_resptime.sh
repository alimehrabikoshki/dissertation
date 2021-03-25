for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    echo "cni    Avg Response Time" > ../../results/results/tsv/${testcase}/apache_${test}_avg_resptime_stats.tsv
  done
done

for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    for n in ../../results/results/raw/${testcase}/*${test}_stdout.log
    do
       echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep -v "across all concurrent requests" ${n}| grep "Time per request:" |  sed 's/[#\/sec] (mean)//g' |  sed 's/Time per request://g')" >> ../../results/results/tsv/${testcase}/apache_${test}_avg_resptime_stats.tsv
    done
  done
done