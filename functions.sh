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
    vpc_list=$(aws ec2 describe-vpcs --query 'Vpcs[*].VpcId' --output text)
    for vpc in vpclist; do
        echo "VPC ID: $vpc"
        echo "---------------------------------------------"
    done
}
