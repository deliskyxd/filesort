#!/bin/bash
# filesort
# Initial README.md commit:
# Bash Script for sorting files initially from download It's point is to have your files organized across your folders to have easy access File extension will be added with time by discovering them.
# ! It's linked to your Downloads folder by default but requires configuration ! ( where do you want to store files / the way of organising them )

echo "Hello,world!"
#Directories 

#grep z configuration.txt

#FROM default directory
temp_file=$(mktemp)
echo $HOME > $temp_file
cat ~/.config/user-dirs.dirs | grep "XDG_DOWNLOAD_DIR" | sed "s/XDG_DOWNLOAD_DIR=//" |  grep -o '[^"]*' | sed 's/$HOME//' >> $temp_file
FROMDIR=`echo "$(head -1 $temp_file)$(tail -n 1 $temp_file)"` 

#TO default directory
echo $HOME > $temp_file
cat ~/.config/user-dirs.dirs | grep "XDG_DOCUMENTS_DIR" | sed "s/XDG_DOCUMENTS_DIR=//" |  grep -o '[^"]*' | sed 's/$HOME//' >> $temp_file
TODIR=`echo "$(head -1 $temp_file)$(tail -n 1 $temp_file)"`

#end
rm $temp_file
