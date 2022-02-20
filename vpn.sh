#!/usr/bin/env bash

echo "vpn"
echo "---"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # http://stackoverflow.com/a/14853319
  NET_OUTPUT=$(ifconfig | grep -o 192.168.20...)
  ID=$(ps aux | grep vpn_connect.sh | grep expect | tr -s ' ' |  cut -d ' ' -f 2)
  if [ -z "$NET_OUTPUT" ]; then
    echo "<span color='red'><tt>Not Connected</tt></span>"
    echo "connect vpn | iconName=utilities-terminal-symbolic bash='~/vpn_connect.sh && exit'"
  else 
    echo "<span color='green'>Connected</span><span color='yellow'><tt> "$NET_OUTPUT"</tt></span>"
    echo "unconnect vpn | iconName=utilities-terminal-symbolic bash='kill -9 $ID; exit'"
  fi
else
  echo "Loading..."
fi
