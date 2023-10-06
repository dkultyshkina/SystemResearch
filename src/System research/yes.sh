#!/bin/bash

filename=$(date +'%d_%B_%Y_%H_%M_%S.status')

echo "File was created: $filename !"
echo "HOSTNAME" >> $filename
hostname >> $filename
echo "TIMEZONE" >> $filename
timedatectl show --va -p Timezone | cut -d '/' -f 1 >> $filename
date +'%Z %:z' >> $filename
echo "USER" >> $filename
whoami >> $filename
echo "OS" >> $filename
lsb_release -cdir | grep "Distributor" >> $filename
cat /etc/os-release | grep "VERSION=" >> $filename
echo "DATE" >> $filename
date +'%d %B %Y %T' >> $filename
echo "UPTIME" >> $filename
uptime -p | cut -d "p" -f 2 >> $filename
echo "UPTIME_SEC" >> $filename
cat /proc/uptime | awk '{print ($1), "seconds"}' >> $filename
echo "IP" >> $filename
ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 1 >> $filename
echo "MASK" >> $filename
ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 2 >> $filename
echo "GATEWAY" >> $filename
ip r | grep default | awk '{print $3}' >> $filename
echo "RAM_TOTAL" >> $filename
free -h | grep "Mem" | awk '{printf("%.3f", $2/(1024))} {print "GB"}' >> $filename
echo "RAW_USED" >> $filename
free -h | grep "Mem" | awk '{printf("%.3f", $3/(1024))} {print "GB"}' >> $filename
echo "RAM_FREE" >> $filename
free -h | grep "Mem" | awk '{printf("%.3f", $4/(1024))} {print "GB"}' >> $filename
echo "SPACE_ROOT" >> $filename
df / -h | grep "/" | awk '{printf("%.2f", $2*1024)} {print "MB"}' >> $filename
echo "SPACE_ROOT_USED" >> $filename
df / -h | grep "/" | awk '{printf("%.2f", $3*1024)} {print "MB"}' >> $filename
echo "SPACE_ROOT_FREE" >> $filename
df / -h | grep "/" | awk '{printf("%.2f", $4*1024)} {print "MB"}' >> $filename

