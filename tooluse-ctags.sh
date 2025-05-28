
#Install ctags
apt install exuberant-ctags
#Generate tags
ctags -R
#Use
#search for definition
Ctrl-]
#Back to original place
Ctrl-t

#Install cscope
apt install cscope
#Generate databse
cscope -R -b
#Use
Ctrl-spacebar + 
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

