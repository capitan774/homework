#!/bin/bash

# 1. Check are there any file with this name

file_name="memory_info_file"
ext=".txt"
ndate=$( date '+%F_%H:%M:%S' )

if [$(ls . | grep "/$file_name") == ""]; then
n_file_name="${file_name}${ext}"
else
n_file_name="${file_name}_${ndate}${ext}"
fi
touch $n_file_name

# 2. Writing info about memtester 8 1 outputing in file
echo "-----Information about memtester 8 1 -----" > $n_file_name
memtester 8 1 >> $n_file_name && echo "------Memtester was wrote sucsesfully------------"

# 3. Writing info about disk usage using DF in file
echo "----- Df -h info -----" >> $n_file_name
sudo df -h | grep /boot >> $n_file_name &&  echo "------ DF info wrote sucsesfully------------"

# 4. Writing info about disk usage /boot in file
echo "----- DU -h info -----" >> $n_file_name
sudo du -h /boot >> $n_file_name  &&  echo "------ DU info wrote sucsesfully------------"

echo "________________________________________"
cat $n_file_name
