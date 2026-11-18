!#/usr/bin/env bash

echo "Top 5 by CPU"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
echo

echo "Top 5 by memory"
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
echo

echo "Processes running : $(ps -e --no-headers | wc -l)"
echo "Zombie processes  : $(ps -eo stat --no-headers | grep -c '^Z')"
