#Question: Write a script to build a Docker image and push it to a private Docker Hub repository.
#!/bin/bash

REPO="myusername/myrepo"
TAG="v1.0"

docker build -t $REPO:$TAG .
docker login -u "myusername" -p "mypassword"
docker push $REPO:$TAG
#Key Concepts: Image tagging, authentication, docker push.
