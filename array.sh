#!/bin/bash
#declare an array or list of values
SERVERS=('10.0.0.1' '10.37.32.164' '19.24.2.4' '9.13.4.2')
for SERVER in ${SERVERS[@]}
do
timeout 2 telnet $SERVER 22
done
