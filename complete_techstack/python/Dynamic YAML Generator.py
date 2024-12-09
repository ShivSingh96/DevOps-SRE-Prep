#Scenario: Write a Python script to generate a Kubernetes deployment YAML file for a given app.
import yaml

def generate_k8s_deployment(app_name, image, replicas):
    deployment = {
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {"name": app_name},
        "spec": {
            "replicas": replicas,
            "selector": {"matchLabels": {"app": app_name}},
            "template": {
                "metadata": {"labels": {"app": app_name}},
                "spec": {"containers": [{"name": app_name, "image": image}]}
            }
        }
    }
    with open(f"{app_name}-deployment.yaml", "w") as file:
        yaml.dump(deployment, file)

generate_k8s_deployment("myapp", "nginx:latest", 3)
#Key Concepts: YAML generation, scripting automation.
