#!/usr/bin/env bash

echo "disk"
echo "---"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # http://stackoverflow.com/a/14853319
  DOCKER_OUTPUT=$(docker ps | grep ros-leadess)
  DEV=$(df -Pht ext4 | grep /dev | tr -s ' ' |  cut -d ' ' -f 1)
  PERCENT=$(df -Pht ext4 | grep /dev | tr -s ' ' |  cut -d ' ' -f 5)
  mapfile -t devs < <( df  | grep /dev | tr -s ' ' |  cut -d ' ' -f 1)
  mapfile -t percents < <( df  | grep /dev | tr -s ' ' |  cut -d ' ' -f 5)
	color_default='\e[0m'
	OUTPUT=""
	for((i=0; i<${#devs[@]}; i++))
	do
		OUTPUT=$"$OUTPUT${devs[i]}  ${percents[i]}\n"
  done
  echo -e $OUTPUT
  echo "<span color='red'><tt>Disk Usage</tt></span>"
  echo "<span color='blue'><tt> "$OUTPUT"</tt></span>"
  echo "clean log | iconName=utilities-terminal-symbolic bash='rosclean purge&& exit'"

else
  echo "Loading..."
fi
