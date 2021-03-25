for testcase in "intrazone" "interzone" "interregion"
do
  cat <<EOF > ../../results/results/tsv/${testcase}/iperf_tcp_20stream_bandwidth_stats.tsv
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
EOF
done

for testcase in "intrazone" "interzone" "interregion"
do
  for n in ../../results/results/raw/${testcase}/*iperf_tcp_20stream.log
  do
     CNI_RESULT=$(echo ${n} |  cut -d '-' -f1 | sed 's:.*/::')
     grep "[SUM]"  ${n} | grep -v "receiver" | grep -v "sender" | awk '{print $7}' > ${n}.tcp_20stream
     sed -i "1i${CNI_RESULT}" ${n}.tcp_20stream
     paste ../../results/results/tsv/${testcase}/iperf_tcp_20stream_bandwidth_stats.tsv ${n}.tcp_20stream > tmpfile && mv tmpfile ../../results/results/tsv/${testcase}/iperf_tcp_20stream_bandwidth_stats.tsv
  done
done