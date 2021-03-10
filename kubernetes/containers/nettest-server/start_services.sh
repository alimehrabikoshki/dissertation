#!/bin/bash
nginx -g 'daemon off;' &
iperf -s -p 5201
tail -f /dev/null
