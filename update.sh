#!/bin/bash
echo "choose which feature you want to install or update: "
mapfile -t topics < <( ls | grep .sh | grep -v setup | grep -v update)
color_default='\e[0m'
for((i=0; i<${#topics[@]}; i++))
do
  color="\e[1;$(($i%7+31))m"
  topic_with_header="${color}$i${color_default}: ${topics[i]}"
  echo -e "${topic_with_header}"
done
read -r index
cp "${topics[index]}" ~/.config/argos/
