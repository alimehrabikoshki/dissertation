set terminal pngcairo size 1000, 700
outputular=sprintf("iperf_tcp_20stream_%s_avg_retransmissions.png", ARG1)
path=sprintf("../../results/results/png/%s/", ARG1)
outputular=sprintf("%s%s", path, outputular)
set output outputular
titular=sprintf("iPerf3 TCP Average Retransmissions - 20 sessions - %s", ARG1)
set title titular
set size 1,1
set grid y
set ylabel "Average Retransmissions (Packets)"

set boxwidth 0.6 relative
set style fill solid 0.5

filename=sprintf("../../results/results/tsv/%s/iperf_tcp_20stream_avg_retransmissions_stats.tsv", ARG1)
plot filename using 2:xtic(1) title ""  with boxes linecolor rgb "blue", \
    ""  using 0:($2+500):(sprintf("%3.f",$2)) with labels notitle
