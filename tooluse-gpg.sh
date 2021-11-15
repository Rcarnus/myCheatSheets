
#Generate key
gpg --full-gen-key

#Import key of a remote peer
gpg --import mary-geek.key

#Trust a key
gpg --sign-key mary-geek@protonmail.com

#Export our public key
gpg --output ~/rcarnus.key --armor --export user@email.com

#Encrypt file
gpg --encrypt --sign --armor -r user@email.com --output encrypted.gpg file.txt

#Decrypt file
gpg --decrypt coded.asc > plain.txt

