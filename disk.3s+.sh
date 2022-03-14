#!/usr/bin/env bash

echo "disk"
echo "---"

if [ "$ARGOS_MENU_OPEN" == "true" ]; then
  # http://stackoverflow.com/a/14853319
  mapfile -t devs < <( df -Pht ext4  | grep /dev | tr -s ' ' |  cut -d ' ' -f 1)
  mapfile -t percents < <( df -Pht ext4  | grep /dev | tr -s ' ' |  cut -d ' ' -f 5)

	OUTPUT=""
	for((i=0; i<${#devs[@]}; i++))
	do
		OUTPUT=$"$OUTPUT${devs[i]}  ${percents[i]}\n"
  done
  #echo -e $OUTPUT
  echo "<span color='red'><tt>Disk Usage</tt></span>"
  echo "<span color='blue'><tt>"$OUTPUT"</tt></span>"
  echo "clean log | iconName=utilities-terminal-symbolic bash='rosclean purge -y&& exit'"

else
  echo "Loading..."
fi
