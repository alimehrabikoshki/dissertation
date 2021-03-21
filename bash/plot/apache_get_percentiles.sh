for testcase in ["intrazone" "interzone" "interregion"]
do
  for test in ["5M_800" "1M_200"]
  do
    cat <<EOF > ../results/tsv/${testcase}/apache_${test}_percentile_stats.tsv
    Percentile
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

for testcase in ["intrazone" "interzone" "interregion"]
do
  for test in ["5M_400" "1M_200"]
  do
    for n in ../results/raw/${testcase}/*${test}_stdout.log
    do
       # shellcheck disable=SC2046
       CNI_RESULT=$(echo ${n} |  cut -d '-' -f1)
       grep -A 8 "50%"  ../results/raw/${testcase}/${n} | sed 's/(longest request)//g' > ../results/tsv/${testcase}/${n}.percentiles
       sed -i "1i${CNI_RESULT}" ../results/tsv/${testcase}/${n}.percentiles
       paste ../results/tsv/${testcase}/apache_${test}_percentile_stats.tsv ../results/tsv/${testcase}/${n}.percentiles > tmpfile && mv tmpfile ../results/tsv/${testcase}/apache_${test}_percentile_stats.tsv
    done
  done
done