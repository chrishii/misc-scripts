#!/bin/bash

APT_BIN=/usr/bin/apt-get

if [[ ! $EUID -eq 0 ]];then
  if [[ -x "$(command -v sudo)" ]]; then
    exec sudo bash "$0" "$@"
    exit $?
  else
    echo "This script must be run as root." 1>&2
    exit 1
  fi
fi

$APT_BIN update && \
$APT_BIN -y upgrade && \
$APT_BIN -y dist-upgrade && \
$APT_BIN -y autoremove && \
$APT_BIN -y autoclean

if [[ ! $? -eq 0 ]]; then
    echo "Error, update not completed successfully." 1>&2
    exit 1

echo "Update completed successfully." 1>&2
exit 0
