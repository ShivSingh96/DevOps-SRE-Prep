#Question: Write a Python script to back up a directory to an S3 bucket using boto3.
import boto3
import os

def backup_to_s3(directory, bucket_name):
    s3_client = boto3.client("s3")
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            s3_client.upload_file(file_path, bucket_name, os.path.relpath(file_path, directory))

backup_to_s3("/path/to/backup", "my-s3-bucket")
#Key Concepts: os.walk for file traversal, boto3 for AWS integration.
