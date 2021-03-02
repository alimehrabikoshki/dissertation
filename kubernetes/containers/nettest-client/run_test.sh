#!/bin/bash
iperf3 --client ${SERVER_IP} -t 60 --set-mss 1460 --congestion=bbr --logfile iperf_results.txt
epoc=$(date "+%s")

IFS=$'\n'
# shellcheck disable=SC2207
iperf_results=( $(cat iperf_results.txt | grep -o '[0-9]\+\.[0-9]\+ Mbits\/sec' | cut -d " " -f 1) )
results_count="${#iperf_results[@]}"

rrdtool create iperf.rrd --step=1 --start=$epoc-$results_count DS:ds1:GAUGE:1:U:U RRA:AVERAGE:0.5:1:$results_count

START=$(expr $epoc - $results_count)
COUNT=$results_count
for (( i = 0; i < ${COUNT}; i++ )); do
VALUE=${iperf_results[i]}
rrdtool update iperf.rrd ${START}:${VALUE}
START=$(expr ${START} + 1)
done

rrdtool graph iperf.png --start $epoc-$results_count --end now
curl -X PUT -H 'content-type: text/plain' -d @iperf.png https://storage.googleapis.com/tf_remote_state_amkdiss_test?x-goog-signature=4eecb2b2ce4714aff93678be7402906f4dbebc18e5c6fd72cab3bbba56202c2295fb3468c6fa4a95f01a4a68da9c28d67cdcfc951d6933cfded4d07a840beff5e5b2c5ed4703b6f8bd7bd7c58154610e437d68f4594392fa0ee82adc514c26dbff33fddfe24a00bb8592b4c941a460307d848449fbb5c9e44e004f39f6c95b99f9f47c5edd435c93e58cc5cbb13096c390e7ffbbb5acfac1808a2c5b66adad207e20b3e8703ba1af366b9f8ee116fae8d57ddd50509135c0ea273ba8d5c5ca752f37911389b63d17153061caf67d0eb17fa7ed946d6d1541ef513ec9c73ce86a8301f96a061242fe3f6756dd94fcd86cbfe1449830da16dfc0a6146d96a9019e&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=terraform-service%40voltaic-reducer-304616.iam.gserviceaccount.com%2F20210301%2Feurope-west2%2Fstorage%2Fgoog4_request&x-goog-date=20210301T164716Z&x-goog-expires=3600&x-goog-signedheaders=content-type%3Bhost


