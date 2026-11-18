#!/usr/bin/env bash
# sudo ss -tulnp | grep :<PORT>

echo "Local IP  :$(hostname -I | awk '{print $1}')"
echo "Gateway   :$(ip route | awk '/^default/ {print $3; exit}')"
echo "DNS       :$(awk '/^nameserver/ {print $2}' /etc/resolv.conf | xargs)"
echo "Public IP :$(curl -s --max-time 5 ifconfig.me || echo unavailable)"
echo 

echo "Interfaces:"
ip -br addr show
echo 

echo "Ports listening for connections:"
ss -tuln | awk 'NR > 1 {print $1, $5}' | sort -u | column -t
