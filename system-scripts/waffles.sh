#!/usr/bin/env bash

echo "-----[ System Information ]-----" | lolcat
./sysinfo.sh 
echo

echo "-----[ Network Information ]-----" | lolcat
./netinfo.sh 
echo

echo "-----[ System Hogs ]-----" | lolcat
./hogs.sh 
echo

echo "-----[ Temu Security Audit* ]-----" | lolcat
./secaudit.sh
echo

echo "-----[ System Health ]-----" | lolcat
./health.sh
echo

echo "-----[ Notes  ]-----"
echo "  [!] Run this with sudo for temu security script to function properly."
echo "  [!] Running with sudo will cause the lolcat command to fail. "
