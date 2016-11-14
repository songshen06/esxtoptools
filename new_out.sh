#!/bin/bash
# $1 is org esxtop data
if [ -z "$1" ]
  then
    echo "Please input the org esxtop date!"
fi

awk -F , {'print $1}' $1 > 1.csv 
cat column | while read LINE
do gawk -F , -v var="$LINE" '{print $var}' $1 > temp"$LINE".csv
done
paste -d, 1.csv temp*.csv > new.csv 
 
