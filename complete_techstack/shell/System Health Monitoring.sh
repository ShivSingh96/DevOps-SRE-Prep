#Question Recap
#Write a shell script to check CPU, memory, and disk usage on a server. If any metric exceeds 80%, log the alert to a file with a timestamp.
#!/bin/bash

LOG_FILE="/var/log/system_health.log"
THRESHOLD=80

# Function to log alerts
log_alert() {
    echo "$(date): $1" >> $LOG_FILE
}

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( ${CPU_USAGE%.*} > THRESHOLD )); then
    log_alert "High CPU usage: ${CPU_USAGE}%"
fi

# Check memory usage
MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
if (( MEMORY_USAGE > THRESHOLD )); then
    log_alert "High Memory usage: ${MEMORY_USAGE}%"
fi

# Check disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if (( DISK_USAGE > THRESHOLD )); then
    log_alert "High Disk usage: ${DISK_USAGE}%"
fi
#Explanation
#top is used for CPU usage.
#free calculates memory usage.
#df checks disk usage.
#Alerts exceeding thresholds are logged to /var/log/system_health.log.
