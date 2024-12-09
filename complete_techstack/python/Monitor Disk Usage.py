#Scenario: Write a Python script to monitor disk usage on multiple servers and alert if usage exceeds 80%.
import os
import smtplib

def check_disk_usage(threshold):
    usage = os.statvfs("/")
    percent_used = (usage.f_blocks - usage.f_bfree) / usage.f_blocks * 100
    return percent_used > threshold

if check_disk_usage(80):
    with smtplib.SMTP('smtp.example.com') as server:
        server.sendmail(
            "admin@example.com",
            "ops@example.com",
            "Subject: Disk Usage Alert\n\nDisk usage exceeded 80%!"
        )
#Key Concepts: Disk monitoring, alerting, SMTP.
