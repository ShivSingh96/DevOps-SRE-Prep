#Question: Write a shell script to clean up all unused Docker containers, images, volumes, and networks.
#!/bin/bash

docker system prune -a --volumes -f
#Key Concepts: Resource management.
