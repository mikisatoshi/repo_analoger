#!/bin/bash
ls
while :
do
  cd
  cd pi_analoger
  python analoger.py 1
  cd
  files="/home/pi/repo_analoger/storage/*"
  for pathfile in $files
  do
    echo $pathfile
    name="${pathfile##*/}"
    echo $name
    ./dropbox_uploader.sh upload $pathfile /home/pi/projects/pi_analoger/$name
    rm $pathfile
  done
done

