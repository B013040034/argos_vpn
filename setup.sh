#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Prevent root execution
if [ $(id -u) -eq 0 ]; then
  echo "Don't run as root" >&2
  exit 1
fi

read -p "Are you share about that?. [y/N] " answer

if [[ $answer = [cC] ]]; then
  sudo apt install -y cowsay
  export answer=y
fi

mkdir $SCRIPT_DIR/argos
mkdir ~/.config/argos
cp $SCRIPT_DIR/vpn.3s+.sh ~/.config/argos/vpn.3s+.sh
sudo chmod 777 ~/.config/argos/vpn.3s+.sh

case $answer in
  [yY]* )
    sudo apt install -y ansible
    cd $SCRIPT_DIR/ansible
    ansible-playbook -i localhost, $SCRIPT_DIR/ansible/setup.yml -i $SCRIPT_DIR/inventories/local-dev.ini -e DIR=$SCRIPT_DIR
    echo -e "\e[32mComplete \e[0m"
    ;;
  * )
    echo -e "\e[33mCanceled \e[0m"
    ;;
esac

cp -r $SCRIPT_DIR/argos/argos@pew.worldwidemann.com ~/.local/share/gnome-shell/extensions/
