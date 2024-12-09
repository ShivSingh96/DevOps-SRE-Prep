#Write a python script to monitor disk usage and send an email alert if usage exceeds 80%.
import shutil
import smtplib
from email.mime.text import MIMEText

def check_disk_usage(path="/"):
    total, used, free = shutil.disk_usage(path)
    percent_used = (used / total) * 100
    return percent_used

def send_email_alert(usage):
    sender = "your_email@example.com"
    receiver = "alert_recipient@example.com"
    subject = "Disk Usage Alert"
    body = f"Warning: Disk usage is at {usage:.2f}%."
    
    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = sender
    msg["To"] = receiver

    with smtplib.SMTP("smtp.example.com", 587) as server:
        server.starttls()
        server.login("your_email@example.com", "your_password")
        server.sendmail(sender, receiver, msg.as_string())

disk_usage = check_disk_usage()
if disk_usage > 80:
    send_email_alert(disk_usage)

#Key Concepts: shutil for disk stats, smtplib for sending emails.
