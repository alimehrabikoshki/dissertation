set terminal pngcairo size 1280, 800
outputular=sprintf("iperf_udp_20stream_%s_packetspersecond.png", ARG1)
path=sprintf("../../results/results/png/%s/", ARG1)
outputular=sprintf("%s%s", path, outputular)
set output outputular
titular=sprintf("iPerf3 UDP Packets per second - 20 session - %s", ARG1)
set title titular
set size 1,0.6
set grid y
set xlabel "Time (s)"
set ylabel "Packets per second"

set rmargin 20
set key right top
set key outside maxcols 1 maxrows 7
filename=sprintf("../../results/results/tsv/%s/iperf_udp_20stream_pps_stats.tsv", ARG1)
header = system("head -n 1 ".filename)
label1 = word(header,1)
label2 = word(header,2)
label3 = word(header,3)
label4 = word(header,4)
label5 = word(header,5)
label6 = word(header,6)
label7 = word(header,7)




plot filename using 2 title label1 with lines dashtype 10, \
     filename using 3 title label2 with lines dashtype 11, \
     filename using 4 title label3 with lines dashtype 12, \
     filename using 5 title label4 with lines dashtype 13, \
     filename using 6 title label5 with lines dashtype 14, \
     filename using 7 title label6 with lines dashtype 15, \
     filename using 8 title label7 with lines dashtype 16, \