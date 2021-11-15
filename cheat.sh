#!/bin/bash

CHEATSHEETS="/opt/outils/cheatsheets/myCheatSheets/tooluse-*"


printusage(){
	echo "
	cheat <searchstring>

CHEATSHEETS=$CHEATSHEETS
	"
}

if [ "$1" == "" ]; then
	printusage
	exit 1
fi


vim -c ":Ack! $1 $CHEATSHEETS"
