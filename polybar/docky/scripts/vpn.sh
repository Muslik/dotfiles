#!/bin/bash

active=$(nmcli -c no -t -f NAME,TYPE,STATE con show --active | grep ':vpn:' | cut -d: -f1)

if [[ -n "$active" ]]; then
    echo "󰦝 $active"
fi
