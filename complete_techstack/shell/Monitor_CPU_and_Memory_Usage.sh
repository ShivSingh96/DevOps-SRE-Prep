#Question: Write a shell script to monitor CPU and memory usage every 5 seconds and log it to a file.
#!/bin/bash

log_file="system_usage.log"

while true; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    mem_usage=$(free -m | awk '/Mem:/ {print $3/$2 * 100.0}')
    echo "$timestamp CPU: ${cpu_usage}% MEM: ${mem_usage}%" >> $log_file
    sleep 5
done
#Key Concepts: top, awk, date.
