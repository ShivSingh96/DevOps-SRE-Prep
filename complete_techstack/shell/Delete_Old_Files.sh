#Question: Write a script to delete files older than 30 days from a given directory.
#!/bin/bash

directory="/path/to/directory"

find $directory -type f -mtime +30 -exec rm -f {} \;
#Key Concepts: find, mtime.
