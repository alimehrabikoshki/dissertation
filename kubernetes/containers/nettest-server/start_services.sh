#!/bin/bash
nginx -g 'daemon off;' &
iperf3 -s -p 5201
tail -f /dev/null
