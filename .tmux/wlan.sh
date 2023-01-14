#!/bin/bash

IP=$(ip addr show wlp2s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 2>&1)

if [ ! -z "$IP" ] 
then
  echo "直 [$IP]"
else
  echo "睊"
fi
