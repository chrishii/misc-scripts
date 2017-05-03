#!/bin/bash

APTBIN=/usr/bin/apt-get

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "Started backup at $(date)."

$APTBIN update
$APTBIN -y upgrade
$APTBIN -y dist-upgrade
$APTBIN -y autoremove
$APTBIN -y autoclean

echo "Completed backup at $(date)."

exit 0
