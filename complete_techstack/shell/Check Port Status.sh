#Question: Write a script to check if port 80 is open on a list of servers.
#!/bin/bash

servers=("server1.example.com" "server2.example.com")

for server in "${servers[@]}"; do
    nc -z -w5 $server 80
    if [ $? -eq 0 ]; then
        echo "Port 80 is open on $server"
    else
        echo "Port 80 is closed on $server"
    fi
done
#Key Concepts: nc, for loop, exit codes.
