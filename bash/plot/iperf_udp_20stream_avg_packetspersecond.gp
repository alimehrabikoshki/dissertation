set terminal pngcairo size 1000, 700
outputular=sprintf("iperf_udp_20stream_%s_avg_packetspersecond.png", ARG1)
path=sprintf("../../results/results/png/%s/", ARG1)
outputular=sprintf("%s%s", path, outputular)
set output outputular
titular=sprintf("iPerf3 UDP Average Packets per second - 20 sessions - %s", ARG1)
set title titular
set size 1,1
set grid y
set ylabel "Average Packets per second"

set boxwidth 0.6 relative
set style fill solid 0.5

filename=sprintf("../../results/results/tsv/%s/iperf_udp_20stream_avg_pps_stats.tsv", ARG1)
plot filename using 2:xtic(1) title ""  with boxes linecolor rgb "blue", \
    ""  using 0:($2+2000):(sprintf("%3.f",$2)) with labels notitle
