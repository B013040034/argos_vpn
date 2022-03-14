#!/usr/bin/env bash

echo "ros"
echo "---"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # http://stackoverflow.com/a/14853319
  DOCKER_OUTPUT=$(docker ps | grep ros-leadess)
  ID=$(docker ps | grep ros-leadess | tr -s ' ' |  cut -d ' ' -f 1)
  IDA=$(docker ps -a | grep ros-leadess | tr -s ' ' |  cut -d ' ' -f 1)
  echo "Open Termiantor | iconName=utilities-terminal-symbolic bash='terminator -l 123 && exit'"
  if [ -z "$DOCKER_OUTPUT" ]; then
    echo "<span color='red'><tt>Closed</tt></span><span color='blue'><tt> "$IDA"</tt></span>"
    echo "docker start | iconName=utilities-terminal-symbolic bash='docker start $IDA&& exit'"
  else 
    echo "<span color='green'>RUNNING</span><span color='blue'><tt> "$ID"</tt></span>"
    echo "docker stop | iconName=utilities-terminal-symbolic bash='docker stop $ID; exit'"
  fi

else
  echo "Loading..."
fi
