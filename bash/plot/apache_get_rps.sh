echo "cni    Requests per second" > ../results/tsv/*/apache_rps_stats.tsv
for testcase in ["intrazone" "interzone" "interregion"]
do
  for test in ["5M_800" "1M_200"]
  do
    for n in ../results/raw/${testcase}/*{test}_stdout.log
    do
       echo "$(cat ${n} |  cut -d '-' -f1)    $(grep "Requests per second:" ${n}| sed 's/[#\/sec] (mean)//g' | sed 's/Requests per second://g')" >> ../results/tsv/${testcase}/apache_${test}_rps_stats.tsv
    done
  done
done