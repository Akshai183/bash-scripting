#Find the valid region based on the availibility zones.
#!/bin/bash
aws_regions=(us-east-1 us-east-2 ap-southeast-2 hyd-india-1 eu-north-1 ap-south-1 eu-west-3 eu-west-2 eu-west-1 ap-northeast-2)
Get_VPC() {
    echo "Running The Functon To List Zones using regions list"
    for region in ${aws_regions[@]}; do
        echo "Getting Availibility Zones in $region.."
        az_list=$(aws ec2 describe-availability-zones --region $region | jq ".AvailabilityZones[].ZoneName" -r)
        az_arr=(${az_list[@]})
        if [ ${#az_arr[@]} -gt 0 ]; then
            #echo ${vpc_list[@]}
            for zone in ${az_arr[@]}; do
                echo "The Zone Name is: $zone"
            done
            echo "#######################"
        else
            echo 'Invalid Region..!!'
            echo "##########################"
            echo "# Breaking at $region #"
            echo "#########################"
            break
        fi
    done
}
Get_VPC
