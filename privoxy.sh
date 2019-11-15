#!/bin/sh
gw=$(ip route | awk '/default/ {print $3}')
ip route add to 192.168.1.0/24 via $gw dev eth0
privoxy --no-daemon