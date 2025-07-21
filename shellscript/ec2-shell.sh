#!/bin/bash

AMI=ami-05ffe3c48a9991133
SG_ID=sg-050ef4889bc4a5a82
INSTANCES=("mongodb" "catalogue" "cart" "user" "redis")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    IP_ADDRESS=$(aws ec2 run-instances --image-id ami-05ffe3c48a9991133 --instance-type $INSTANCE_TYPE --security-group-ids sg-050ef4889bc4a5a82 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query Instances[0].PrivateIpAddress --output text)
    echo "$i: $IP_ADDRESS"
done
