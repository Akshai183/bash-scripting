timeout 3 telnet 10.1.1.100 22
for server in $(cat /tmp/servers); do timeout 3 telnet $server 22; done
