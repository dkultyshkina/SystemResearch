#!/bin/bash

echo "HOSTNAME"
hostname
echo "TIMEZONE" 
timedatectl show --va -p Timezone | cut -d '/' -f 1
date +'%Z %:z'
echo "USER"
whoami
echo "OS"
lsb_release -cdir | grep "Distributor"
cat /etc/os-release | grep "VERSION="
echo "DATE"
date +'%d %B %Y %T'
echo "UPTIME"
uptime -p | cut -d "p" -f 2
echo "UPTIME_SEC"
cat /proc/uptime | awk '{print ($1), "seconds"}'
echo "IP"
ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 1
echo "MASK"
ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 2
echo "GATEWAY"
ip r | grep default | awk '{print $3}'
echo "RAM_TOTAL"
free -h | grep "Mem" | awk '{printf("%.3f", $2/(1024))} {print "GB"}'
echo "RAW_USED"
free -h | grep "Mem" | awk '{printf("%.3f", $3/(1024))} {print "GB"}'
echo "RAM_FREE"
free -h | grep "Mem" | awk '{printf("%.3f", $4/(1024))} {print "GB"}'
echo "SPACE_ROOT"
df / -h | grep "/" | awk '{printf("%.2f", $2*1024)} {print "MB"}'
echo "SPACE_ROOT_USED"
df / -h | grep "/" | awk '{printf("%.2f", $3*1024)} {print "MB"}'
echo "SPACE_ROOT_FREE"
df / -h | grep "/" | awk '{printf("%.2f", $4*1024)} {print "MB"}'

sh write.sh
