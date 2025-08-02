#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
MESSAGE=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="High Disk Threshold on $partition: $usage <br>"
    fi
done <<< $DISK_USAGE
 
echo -e "message: $MESSAGE"

#echo "$MESSAGE | mail.sh "High Disk Usage" rajithagona.7310@gmail.com"

sh mail.sh "Monitering Team" "High Disk Usage" "$MESSAGE" "rajithagona.7310@gmail.com" "High Alert"