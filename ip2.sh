#!/bin/bash
# show the IP of the secondary network interface like tun0 (vpn)
ip=$(hostname -I | awk '{print $2}')
if [ -z "$ip" ]; then
echo 'No VPN'
else
echo $ip
fi
# show external ip
ip2=$(curl -s https://api.ipify.org)
echo $ip2
