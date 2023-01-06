#!/bin/bash

UUID=$(cat $HOME/uuid_hdd.txt)
device_info=$(lsblk -lf | grep "$UUID" | awk '{print $1}')
device_info=$(echo "$device_info" | tr -d '[:space:]')
device_dir=$(echo "$device_info" | grep -o 'sd[a-z][0-9]')

echo "$device_dir"
