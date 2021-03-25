for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    echo "cni    Requests per second" > ../../results/results/tsv/${testcase}/apache_${test}_rps_stats.tsv
  done
done

for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    for n in ../../results/results/raw/${testcase}/*${test}_stdout.log
    do
       echo "$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')    $(grep "Requests per second:" ${n}| sed 's/[#\/sec] (mean)//g' | sed 's/Requests per second://g')" >> ../../results/results/tsv/${testcase}/apache_${test}_rps_stats.tsv
    done
  done
done