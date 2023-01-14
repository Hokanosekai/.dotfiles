#!/bin/bash 

IP=$(ip addr show enp1s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 2>&1)

if [ ! -z "$IP" ] 
then
  echo " [$IP]"
else
  echo ""
fi
