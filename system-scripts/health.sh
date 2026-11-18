#!/usr/bin/env bash

read l1 l5 l15 _ < /proc/loadavg
cores=$(nproc)
mood=$(awk -v l="$l1" -v c="$cores" 'BEGIN { print (l > c) ? "OVERLOADED" : "relaxed" }')
echo "Load     : $l1  $l5  $l15  on $cores cores ($mood)"

free -m | awk '/^Mem/ { printf "RAM      : %d MB used, %d MB available of %d MB\n", $3, $7, $2 }'
echo

echo "Disk usage:"
df -h --output=target,pcent -x vfat -x tmpfs -x devtmpfs -x squashfs | tail -n +2 |
while read -r mount pct; do
  n=${pct%\%}
  if   [ "$n" -ge 90 ]; then flag=$'\e[31mDANGER\e[0m'
  elif [ "$n" -ge 75 ]; then flag=$'\e[33mWATCH IT\e[0m'
  else                       flag=$'\e[32mOK\e[0m'
  fi
  printf "  %-22s %5s %s\n" "$mount" "$pct" "$flag"
done
