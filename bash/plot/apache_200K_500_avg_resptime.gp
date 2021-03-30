set terminal pngcairo size 1000, 700
outputular=sprintf("apache_200K_500_%s_avg_resptime.png", ARG1)
path=sprintf("../../results/results/png/%s/", ARG1)
outputular=sprintf("%s%s", path, outputular)
set output outputular
titular=sprintf("ApacheBench HTTP Average response time - 200K Requests - 500 sessions - %s", ARG1)
set title titular
set size 1,1
set grid y
set ylabel "Average Response time (ms)"

set boxwidth 0.6 relative
set style fill solid 0.5

filename=sprintf("../../results/results/tsv/%s/apache_200K_500_avg_resptime_stats.tsv", ARG1)
plot filename using 2:xtic(1) title ""  with boxes fill, \
    ""  using 0:($2+200):(sprintf("%3.f",$2)) with labels notitle
