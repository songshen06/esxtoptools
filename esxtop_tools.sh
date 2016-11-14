#!/bin/bash
echo "Need vobd.log to get all naa list!"
FILE=column
function getcolumn(){
 arr=($( grep vob.scsi.device.io.latency.high vobd.log | grep $1 | awk '{print $6}'))
   for i in "${arr[@]}"
           do echo $i
           grep -n "Disk SCSI Device($i).*Average Driver MilliSec/Command" headers | awk -F :  '{print $1}' >> column
           grep -n "Disk SCSI Device($i).*Average Kernel MilliSec/Command" headers | awk -F :  '{print $1}' >> column
           grep -n "Disk SCSI Device($i).*Average Guest MilliSec/Command" headers | awk -F :  '{print $1}' >> column
           done
echo "$2)\Failed Commands"
echo "$2)\Commands"
grep -n $2')\\Failed Commands' headers | awk -F :  '{print $1}' >> column
grep -n $2')\\Commands' headers | awk -F :  '{print $1}' >> column
}
if [ -z "$1" ]
  then
    echo "Please input the org esxtop date!"
fi
if [ -z "$2" ]
  then
    echo "Please input the vmba number"
fi
if [ -e "$FILE" ];then 
   echo "$FILE esxist,will be delete"
   rm -rf $FILE
   getcolumn $1 $2 
else  
   getcolumn $1 $2 
fi

