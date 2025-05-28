# myCheatSheets

## Requirements
vim-ack plugin 'mileszs/ack.vim'
silversearcher-ag
ack

## Installation of ack.vim
If you are not familiar (like me) with vim plugins, this is how to install ack.vim with vim-plug.

Install vim-plug:
```
#https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Add the vim.ack plugin in the vim-plug section of you .vimrc:
```
call plug#begin()
" List your plugins here
Plug 'mileszs/ack.vim'
call plug#end()
```

Start vi without a file:
```
vi
```
Use the PlugInstall command to install the missing plugins:
```
:PlugInstall
```


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
