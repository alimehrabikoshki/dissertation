#!/bin/bash
nginx -g 'daemon off;' &
iperf3 -s -p 5201 > /tmp/iperf-server.log
tail -f /dev/null
