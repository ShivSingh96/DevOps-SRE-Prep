#Scenario: Write a shell script to fetch logs of a specific pod in a namespace.
#!/bin/bash

NAMESPACE=$1
POD_NAME=$2

if [[ -z "$NAMESPACE" || -z "$POD_NAME" ]]; then
  echo "Usage: $0 <namespace> <pod-name>"
  exit 1
fi

kubectl logs -n $NAMESPACE $POD_NAME
#Key Concepts: Namespace management, logs.
