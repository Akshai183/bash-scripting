#!/bin/bash
Regions=$*
for region in  $Regions; do
  cowsay "#------------------- ${region} -------------------#"
  aws ec2 describe-vpcs --region $region | jq '.Vpcs[].VpcId' 
done

# Path: check_Vpc_list.sh