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
Use cheat.sh to search in your cheatsheets. Add a keyword to search:
```
cheat.sh
cheat.sh ntlmrelayx
```
For instance
```
cheat.sh iex
```
![Search Results](https://github.com/Rcarnus/myCheatSheets/blob/main/doc/searchExampleIex.png?raw=true)

Select Enter to see the corresponding result:
![Selecting Search Results](https://github.com/Rcarnus/myCheatSheets/blob/main/doc/searchExampleIex2.png?raw=true)

Do Ctrl-N to go to the next result:
![Navigating Search Results](https://github.com/Rcarnus/myCheatSheets/blob/main/doc/searchExampleIex3.png?raw=true)

Do Ctrl-P to go to the previous one

Enjoy
