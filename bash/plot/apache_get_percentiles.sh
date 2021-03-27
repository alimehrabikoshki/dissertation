for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    cat <<EOF > ../../results/results/tsv/${testcase}/apache_${test}_percentile_stats.tsv

50%
66%
75%
80%
90%
95%
98%
99%
100%
EOF
  done
done

for testcase in "intrazone" "interzone" "interregion"
do
  for test in "100K_250" "200K_500"
  do
    for n in ../../results/results/raw/${testcase}/*${test}_stdout.log
    do
       # shellcheck disable=SC2046
       CNI_RESULT=$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')
       grep -A 8 "50%"  ${n} | awk '{print $2}' |  sed 's/(longest request)//g' > ../../results/results/tsv/${testcase}/${CNI_RESULT}.percentiles
       sed -i "1i${CNI_RESULT}" ../../results/results/tsv/${testcase}/${CNI_RESULT}.percentiles
       paste ../../results/results/tsv/${testcase}/apache_${test}_percentile_stats.tsv ../../results/results/tsv/${testcase}/${CNI_RESULT}.percentiles > tmpfile && mv tmpfile ../../results/results/tsv/${testcase}/apache_${test}_percentile_stats.tsv
    done
  done
done