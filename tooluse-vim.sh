

# Install vim-plug
#https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Add a vim-plug section to your ~/.vimrc
##  Begin the section with call plug#begin()
##  List the plugins with Plug commands
##  End the section with call plug#end()


vi
# Inside vim, lunch the PlugInstall command
:PlugInstall
