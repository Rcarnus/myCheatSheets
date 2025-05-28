# myCheatSheets

## Requirements
vim-ack plugin 'mileszs/ack.vim'
silversearcher-ag
ack

## Installation
Clone the repo:
```
git clone git@github.com:Rcarnus/myCheatSheets.git
```
Install the requirements:
```
sudo apt install silversearcher-ag ack
```
Configure the CHEATSHEET var in the cheat.sh file to point to the 'tooluse-*' files.
You can just copy the script in a your PATH for more convienience.
```
cd myCheatSheets
sudo cp ./cheat.sh /usr/bin/
```

## Usage
```
cheat.sh
cheat.sh ntlmrelayx
```

Ctrl-N to go to the next result
Ctrl-P to go to the previous one


