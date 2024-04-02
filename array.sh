#!/bin/bash
#declare an array or list of values
SERVERS=('10.0.0.1' '10.37.32.164' '19.24.2.4' '9.13.4.2')
for SERVER in ${SERVERS[@]}; do
    echo "Pinging Server: $SERVER"
    necat -z -n -v $SERVER 22 80 2>&1 | grep succeeded
done
