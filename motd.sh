#!/bin/bash

# Script usually located at /etc/profile.d/motd.sh

White="\033[01;37m"
Blue="\033[01;34m"
Green="\033[0;32m"
Red="\033[0;31m"
DefaultColour="\033[\e[m"

SYSTEMVERSION=$White$(lsb_release -d | awk {'print $2,$3,$4'})$Blue
KERNELVERSION=$White$(uname -r)$Blue
UPTIME=$White$(uptime | tail -c +2)$Blue
MEMUSAGE=$White$(free -m | grep Mem: | awk {'printf "%d% (%dMB of %dMB total)", $3 / $2 * 100.0, $3, $2'})$Blue
DISKUSAGE=$White$(df -h / | sed -sn 2p | awk '{print $5 " (" $3 " of " $2" total)"}' | tr -d '\n')$Blue
WHOAMI=$White$(whoami)$Blue

echo
echo -e "$Blue
 System Version: $SYSTEMVERSION
 Kernel Version: $KERNELVERSION

         Uptime: $UPTIME

      Mem Usage: $MEMUSAGE
     Disk Usage: $DISKUSAGE

   Logged in as: $WHOAMI"
echo -e "$DefaultColour"

echo
