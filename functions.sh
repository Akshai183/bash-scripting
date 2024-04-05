#!/bin/bash
function hello {
    echo "welcome to hello function"
}
function hola() {
    echo "welcome to hola function"
}

#hello
#hola

Get_VPC() {
    echo "running the function to get vpc list"
    vpc_list=$(aws ec2 describe-vpcs --region $1 | jq .Vpcs[].VpcId | tr -d '"')
    for vpc in vpc_list; do
        echo "VPC ID: $vpc"
        echo "---------------------------------------------"
    done
}

Get_VPC "us-east-1"
echo "---------------------------------------------"
Get_VPC "us-west-1"
