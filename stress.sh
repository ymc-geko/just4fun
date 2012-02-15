#!/bin/bash

OutDir=/tmp

clear
for cnt in {1..10}
do
  Date=$(date +%N)
  TmpFile=dd_created_file_$Date
  echo "$(date +%T): running loop $cnt"
  echo "creating file \"$OutDir/$TmpFile\"..."
  dd if=/dev/zero of=$OutDir/$TmpFile bs=1M count=100 > /dev/null
  for zip_cnt in {1..3}
  do
    echo "zipping it...(run $zip_cnt)"
    gzip -9 $OutDir/$TmpFile > /dev/null
    echo "and back again..."
    gzip -d $OutDir/$TmpFile.gz > /dev/null
  done
  rm -f $OutDir/$TmpFile
  echo "====="
done

exit 0
