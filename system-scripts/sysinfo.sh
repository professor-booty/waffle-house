#!/usr/bin/env bash

. /etc/os-release
cpu=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)

echo "Hostname  : $(hostname)"
echo "OS        : $PRETTY_NAME" 
echo "Kernel    : $(uname -r)" 
echo "Arch      : $(uname -m)" 
echo "Uptime    : $(uptime -p)" 
echo "User      : $USER (UID $(id -u))" 
echo "Shell     : $SHELL" 
echo "CPU       : ${cpu:-unknown}" 
echo "Cores     : $(nproc)"
echo "RAM       : $(free -h | awk '/^Mem/ {print $2}')"

