#!/usr/bin/env bash

echo "bright"
echo "---"
if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # http://stackoverflow.com/a/14853319
  NET_OUTPUT=$(ifconfig | grep -o 192.168.20...)
  ID=$(xrandr | grep " connected" | cut -f1 -d " ")
  BRIGHT=$(xrandr --verbose | awk '/Brightness/ { print $2; exit }')
  BRIGHT=$(perl -e "print $BRIGHT*100")
  XRANDR=$(xrandr | grep " connected" | cut -f1 -d " ")
  echo "<span color='green'>brightness</span><span color='blue'><tt> "$BRIGHT"% </tt></span>"
  echo "set 60% | iconName=utilities-terminal-symbolic bash='xrandr --output $XRANDR --brightness 0.6 && exit'"
  echo "set 50% | iconName=utilities-terminal-symbolic bash='xrandr --output $XRANDR --brightness 0.5 && exit'"
  echo "set 40% | iconName=utilities-terminal-symbolic bash='xrandr --output $XRANDR --brightness 0.4 && exit'"
else
  echo "Loading..."
fi
