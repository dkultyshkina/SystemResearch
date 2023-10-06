#!/bin/bash

endcolor="\e[0m"

echo "${1} ${2} HOSTNAME = ${endcolor} ${3} ${4} $(hostname) ${endcolor}"
echo "${1} ${2} TIMEZONE = ${endcolor} ${3} ${4} $(timedatectl show --va -p Timezone | cut -d '/' -f 1) $(date +'%Z %:z') ${endcolor}"
echo "${1} ${2} USER = ${endcolor} ${3} ${4} $(whoami) ${endcolor}"
echo "${1} ${2} OS = ${endcolor} ${3} ${4} $(lsb_release -cdir | grep "Distributor") $(cat /etc/os-release | grep "VERSION=") ${endcolor}"
echo "${1} ${2} DATE = ${endcolor} ${3} ${4} $(date +'%d %B %Y %T') ${endcolor}"
echo "${1} ${2} UPTIME = ${endcolor} ${3} ${4} $(uptime -p | cut -d "p" -f 2) ${endcolor}"
echo "${1} ${2} UPTIME_SEC = ${endcolor} ${3} ${4} $(cat /proc/uptime | awk '{print ($1), "seconds"}') ${endcolor}"
echo "${1} ${2} IP = ${endcolor} ${3} ${4} $(ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 1) ${endcolor}"
echo "${1} ${2} MASK = ${endcolor} ${3} ${4} $(ip -br a show enp0s3 | awk '{print $3}' | cut -d '/' -f 2) ${endcolor}"
echo "${1} ${2} GATEWAY = ${endcolor} ${3} ${4} $(ip r | grep default | awk '{print $3}') ${endcolor}"
echo "${1} ${2} RAM_TOTAL = ${endcolor} ${3} ${4} $(free -h | grep "Mem" | awk '{printf("%.3f", $2/(1024))} {print "GB"}') ${endcolor}"
echo " ${1} ${2} RAW_USED = ${endcolor} ${3} ${4} $(free -h | grep "Mem" | awk '{printf("%.3f", $3/(1024))} {print "GB"}') ${endcolor}"
echo " ${1} ${2} RAM_FREE = ${endcolor} ${3} ${4} $(free -h | grep "Mem" | awk '{printf("%.3f", $4/(1024))} {print "GB"}') ${endcolor}"
echo "${1} ${2} SPACE_ROOT = ${endcolor} ${3} ${4} $(df / -h | grep "/" | awk '{printf("%.2f", $2*1024)} {print "MB"}') ${endcolor}"
echo "${1} ${2} SPACE_ROOT_USED = ${endcolor} ${3} ${4} $(df / -h | grep "/" | awk '{printf("%.2f", $3*1024)} {print "MB"}') ${endcolor}"
echo "${1} ${2} SPACE_ROOT_FREE = ${endcolor} ${3} ${4} $(df / -h | grep "/" | awk '{printf("%.2f", $4*1024)} {print "MB"}') ${endcolor}"


sh printcolors.sh $3 $4 $5 $6 $7 $8
