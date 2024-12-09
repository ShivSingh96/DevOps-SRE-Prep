Mock Scenarios
1. Kubernetes Logs Parsing (Python)
Scenario: Write a Python script to parse Kubernetes pod logs for errors and warnings. Hint: Use re module to search for patterns like "ERROR" or "WARNING".

2. Dynamic IP Address Allocation (Shell)
Scenario: Automate updating a Consul config.json file with the current machine's private IP and restart the service. Hint: Use hostname -I or ifconfig to fetch the IP.

Hands-On Tasks
Write a Python script to deploy a Dockerized app to Kubernetes.
Automate VM provisioning using Ansible and a Python inventory script.
Monitor and log Consul or Nomad cluster status using Python.

Hands-On Scenarios
Automate scaling a Kubernetes Deployment using Python and kubectl commands.
Write a Terraform script to provision an EKS cluster with worker nodes.
Monitor Docker container logs for errors and forward them to a central logging service using Python.

Absolutely! Below are **practice questions** based on the advanced scenarios I provided. These questions are designed to test both your **conceptual understanding** and **practical implementation** skills in Cloud/DevOps tools like Terraform, Docker, Kubernetes, Python scripting, and Shell scripting.

---

### **Terraform Practice Questions**

---

#### **1. Conditional Resource Creation**
- Write a Terraform configuration to create a `Google Compute Engine` instance only if a specific variable, `create_instance`, is set to `true`. Otherwise, no instance should be created.

#### **2. Dynamic Resource Creation with Loops**
- You are given a list of subnet CIDRs (`10.0.1.0/24`, `10.0.2.0/24`, etc.). Write a Terraform script to dynamically create a set of subnets in AWS within a single VPC.

#### **3. Terraform with Modules**
- Write a reusable Terraform module to deploy an EC2 instance and attach an existing IAM role. Show how to call this module to deploy multiple instances.

#### **4. Automated Scaling Policies**
- Create an AWS Auto Scaling Group using Terraform with scaling policies for CPU utilization greater than 80%.

---

### **Docker Practice Questions**

---

#### **1. Multi-Stage Builds**
- Write a multi-stage Dockerfile to build a Go application, where the first stage compiles the Go binary and the second stage runs the compiled binary in a minimal Alpine Linux image.

#### **2. Logging Driver**
- Configure a Docker container to use the Fluentd logging driver. Write a `docker run` command or a Compose file snippet to accomplish this.

#### **3. Docker Networking**
- Create a Docker Compose file for a microservices architecture with two services (`frontend` and `backend`). Use a custom Docker network so the services can communicate privately.

#### **4. Optimized Image Size**
- Write a Dockerfile to minimize the size of a Python Flask app image using `pipenv` for dependency management.

---

### **Kubernetes Practice Questions**

---

#### **1. Deploy and Manage Secrets**
- Write a Kubernetes YAML file to create a secret containing database credentials (`username` and `password`). Update a deployment to use this secret as environment variables.

#### **2. Horizontal Pod Autoscaler (HPA)**
- Deploy an application with Kubernetes and configure HPA to scale based on CPU usage exceeding 50%.

#### **3. Custom Helm Chart**
- Create a Helm chart to deploy a multi-tier application (frontend, backend, database). Ensure the Helm chart supports environment-based overrides.

#### **4. Role-Based Access Control (RBAC)**
- Write a Kubernetes RBAC policy that grants a specific user the ability to manage pods but restricts access to any other resources in the namespace.

---

### **Python Scripting Practice Questions**

---

#### **1. Kubernetes Cluster Automation**
- Write a Python script to list all pods in a Kubernetes cluster and delete pods that are in a `CrashLoopBackOff` state. Use the Kubernetes Python client.

#### **2. Log Parsing**
- Write a Python script to monitor application logs in real time. The script should alert (print) any lines containing the keyword `ERROR` and count the total errors every 10 seconds.

#### **3. AWS Resource Management**
- Write a Python script to:
  1. List all EC2 instances in an AWS account.
  2. Stop any instance tagged with `Environment: Test`.

#### **4. Docker API Automation**
- Write a Python script using the Docker SDK to:
  1. List all running containers.
  2. Stop containers older than 7 days based on their creation timestamp.

---

### **Shell Scripting Practice Questions**

---

#### **1. System Health Monitoring**
- Write a shell script to check CPU, memory, and disk usage on a server. If any of these metrics exceed 80%, log the alert to a file with a timestamp.

#### **2. Bulk Namespace Creation**
- Write a shell script to create Kubernetes namespaces dynamically from a text file (`namespaces.txt`) containing one namespace name per line.

#### **3. Remote Server Automation**
- Write a shell script to:
  1. SSH into a list of servers.
  2. Check if Docker is installed.
  3. Install Docker if it is missing.

#### **4. Backup and Cleanup**
- Write a shell script to back up `/var/log` to an S3 bucket, keeping only the last 7 days of logs locally.

---

### **Advanced Problem-Solving Scenarios**

---

#### **1. Terraform Multi-Provider Setup**
- Use Terraform to deploy resources across multiple cloud providers (e.g., AWS for EC2 and GCP for Compute Engine). Write a sample configuration file.

#### **2. Docker Swarm with Volumes**
- Create a Docker Swarm stack for a WordPress site where the database and uploads are persisted using Docker volumes. Include a `docker-compose.yml` file.

#### **3. Kubernetes Admission Controller**
- Create a validating admission webhook using Python to enforce that all new pods must have a specific label (`team=devops`). Provide the YAML to register this webhook.

#### **4. Python + Kubernetes Automation**
- Write a Python script that:
  1. Scales a deployment up or down based on the number of available nodes in the Kubernetes cluster.
  2. Prints the number of replicas after scaling.

#### **5. Shell Script for CI/CD Pipeline**
- Write a shell script to automate the following steps in a CI/CD pipeline:
  1. Pull the latest code from Git.
  2. Build a Docker image.
  3. Push the image to a private Docker registry.
  4. Deploy the image to a Kubernetes cluster.

---

Would you like me to work through the solutions for any of these questions in detail, or provide more specific examples for certain tools?
