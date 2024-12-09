#Scenario: Write a shell script to create multiple Kubernetes namespaces dynamically from a list.
#!/bin/bash
NAMESPACES=("dev" "staging" "prod")

for ns in "${NAMESPACES[@]}"; do
  kubectl create namespace $ns || echo "Namespace $ns already exists"
done
#Key Concepts: Loops, Kubernetes automation.
