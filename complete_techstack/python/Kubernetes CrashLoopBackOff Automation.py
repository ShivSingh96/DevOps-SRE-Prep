#Question Recap
#Write a Python script to list all pods in a Kubernetes cluster and delete pods in a CrashLoopBackOff state.
from kubernetes import client, config

# Load Kubernetes configuration
config.load_kube_config()

# Create API client
v1 = client.CoreV1Api()

# List all pods in all namespaces
pods = v1.list_pod_for_all_namespaces(watch=False)

# Iterate through each pod
for pod in pods.items:
    pod_name = pod.metadata.name
    pod_namespace = pod.metadata.namespace
    pod_status = pod.status.container_statuses

    # Check if pod is in CrashLoopBackOff
    if pod_status:
        for status in pod_status:
            if status.state.waiting and status.state.waiting.reason == "CrashLoopBackOff":
                print(f"Deleting pod {pod_name} in namespace {pod_namespace}")
                # Delete the pod
                v1.delete_namespaced_pod(name=pod_name, namespace=pod_namespace)
#Explanation
#The script uses the Kubernetes Python client to connect to the cluster.
#Pods with the CrashLoopBackOff status are identified and deleted.
