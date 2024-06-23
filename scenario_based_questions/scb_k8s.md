## Can you explain me end to end when we hit "kubectl create -f pod.yml", like how the pod is getting created within the k8s cluster?
When you run the command `kubectl create -f pod.yml` to create a pod in a Kubernetes cluster, a series of steps occur behind the scenes to ensure the pod is created and scheduled correctly. Here is an end-to-end explanation of the process:

### Step-by-Step Process

1. **Kubectl Command Execution**:
   - **User Input**: You execute the command `kubectl create -f pod.yml`.
   - **API Request**: `kubectl` reads the `pod.yml` file and sends a REST API request to the Kubernetes API server. This request includes the pod specification defined in the YAML file.

2. **API Server Processing**:
   - **Authentication and Authorization**: The API server authenticates the user and checks their permissions to create resources in the specified namespace.
   - **Validation**: The API server validates the pod specification to ensure it conforms to the Kubernetes API schema.
   - **Admission Controllers**: Various admission controllers may modify or validate the request further. For example, they can enforce security policies, default values, and resource quotas.

3. **Etcd Storage**:
   - **Persisting the Pod Definition**: If the request is valid, the API server persists the pod definition in `etcd`, the distributed key-value store used by Kubernetes for all its state data.

4. **Scheduler**:
   - **Pod Scheduling**: The Scheduler continuously monitors the API server for new unscheduled pods. Upon detecting the new pod, it selects an appropriate node based on factors like resource availability, node affinity, taints, tolerations, and other scheduling policies.
   - **Binding the Pod**: The Scheduler binds the pod to the selected node by updating the pod's specification in `etcd` with the chosen node's information.

5. **Kubelet on the Target Node**:
   - **Node Selection**: The Kubelet on the target node detects the newly scheduled pod through the API server.
   - **Pod Lifecycle Management**: The Kubelet reads the pod specification and starts the process of creating the pod. It interacts with the container runtime (e.g., Docker, containerd) to pull the required container images and create the containers.
   - **Pod Creation**: The Kubelet sets up the necessary environment for the pod, including networking (via CNI plugins), volume mounts, and other configurations specified in the pod manifest.

6. **Container Runtime**:
   - **Image Pulling**: The container runtime pulls the necessary container images from a container registry.
   - **Container Creation**: The container runtime creates and starts the containers as per the pod specification.
   - **Networking**: CNI plugins configure the networking for the pod, assigning it an IP address and setting up the necessary network interfaces.

7. **Pod Initialization**:
   - **Init Containers**: If there are any init containers specified, they run to completion before the application containers start.
   - **Application Containers**: Once the init containers complete, the main application containers start running.

8. **Post-Creation Actions**:
   - **Health Checks**: The Kubelet continuously checks the health of the containers using liveness and readiness probes defined in the pod specification.
   - **Updates to the API Server**: The Kubelet regularly updates the pod's status in the API server. This includes information like the pod's state (Pending, Running, Succeeded, Failed) and condition (Ready, NotReady).

9. **Service Discovery and Networking**:
   - **Service Integration**: If the pod is part of a service, the endpoints controller updates the endpoints for the service, enabling other pods to discover and communicate with it.
   - **DNS Updates**: Kubernetes DNS updates to include the new pod if it should be accessible via a service hostname.

10. **Monitoring and Logging**:
    - **Metrics Collection**: Tools like Prometheus may collect metrics from the pod for monitoring purposes.
    - **Logging**: Logs from the pod's containers can be collected by logging agents and sent to centralized logging systems for analysis and storage.

### Summary

Here's a high-level summary of the key steps:

1. **Command Execution**: `kubectl` sends a create request to the API server.
2. **API Server**: Authenticates, validates, and stores the pod specification in `etcd`.
3. **Scheduler**: Selects a node for the pod and binds it.
4. **Kubelet**: On the selected node, reads the pod specification and instructs the container runtime to start the pod's containers.
5. **Container Runtime**: Pulls images, creates, and starts containers.
6. **Networking**: CNI plugins configure networking.
7. **Pod Initialization**: Init and application containers run.
8. **Monitoring**: Health checks, status updates, and logging.

This entire process ensures that a pod defined in a YAML file is correctly created, scheduled, and managed within a Kubernetes cluster.

## How the pod gets it's ip address when we run inside the k8s cluster?
When a pod is created in a Kubernetes cluster, it is assigned an IP address that allows it to communicate with other pods, services, and external networks. This IP assignment process involves several components and mechanisms within Kubernetes. Here’s a detailed explanation of how a pod gets its IP address:

### Steps for IP Address Assignment to a Pod

1. **Kubernetes Networking Model**:
   - **Flat Network**: Kubernetes assumes a flat network where every pod can communicate with every other pod without NAT (Network Address Translation). This means each pod must have a unique IP address within the cluster.

2. **Container Network Interface (CNI) Plugins**:
   - **CNI Plugins**: Kubernetes uses CNI plugins to manage network interfaces within pods. CNI plugins handle the allocation of IP addresses, setup of network interfaces, and configuration of routes.
   - Examples of CNI plugins include Calico, Flannel, Weave, and Cilium.

3. **Pod Creation and Node Selection**:
   - When a pod is created, the Kubernetes scheduler assigns it to a specific node based on resource availability and other scheduling policies.

4. **Kubelet Interaction with CNI Plugin**:
   - **Kubelet**: The Kubelet on the selected node detects the newly scheduled pod and initiates the pod setup process.
   - **CNI Plugin Invocation**: The Kubelet invokes the CNI plugin to set up the network for the pod.

5. **IP Address Allocation**:
   - **IP Address Pool**: The CNI plugin allocates an IP address for the pod from a pool of IP addresses assigned to the node or subnet.
   - **Network Namespace**: The CNI plugin creates a network namespace for the pod, which isolates its networking from other pods.
   - **Network Interface**: The CNI plugin creates a virtual network interface (e.g., veth pair) for the pod and assigns the allocated IP address to this interface.

6. **Network Configuration**:
   - **Routing and NAT**: The CNI plugin sets up the necessary routing rules and, if needed, NAT rules to ensure the pod can communicate with other pods and external services.
   - **Network Policies**: If network policies are defined, they are enforced at this stage to control the traffic to and from the pod based on specified rules.

7. **Pod IP Registration**:
   - **API Server Update**: Once the pod's network is configured, the Kubelet updates the pod’s status in the Kubernetes API server with the assigned IP address.
   - **DNS Integration**: Kubernetes DNS services, such as CoreDNS, get updated with the new pod's IP address if the pod is part of a service, enabling name resolution within the cluster.

### Detailed Example

1. **Pod Definition (pod.yml)**:
   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: example-pod
   spec:
     containers:
     - name: nginx
       image: nginx
   ```

2. **Creating the Pod**:
   ```sh
   kubectl create -f pod.yml
   ```

3. **API Server and Scheduler**:
   - The API server processes the request and stores the pod definition in etcd.
   - The scheduler assigns the pod to a specific node.

4. **Kubelet and CNI Plugin**:
   - The Kubelet on the selected node notices the new pod and triggers the CNI plugin.
   - The CNI plugin allocates an IP address (e.g., 10.244.0.5) and sets up the network namespace, virtual network interface, and routing.

5. **Pod Network Configuration**:
   - The virtual network interface (e.g., veth pair) is created, connecting the pod’s network namespace to the host's network namespace.
   - The CNI plugin assigns the IP address 10.244.0.5 to the pod's network interface.

6. **IP Registration and DNS Update**:
   - The Kubelet updates the pod’s status in the API server with the IP address 10.244.0.5.
   - Kubernetes DNS services (e.g., CoreDNS) update their records if necessary.

7. **Pod Communication**:
   - The pod can now communicate with other pods and services within the cluster using its IP address.
   - Network policies are enforced as configured to control traffic flow.

### Summary

The process of assigning an IP address to a pod in a Kubernetes cluster involves the following key components and steps:
1. **CNI Plugin**: Allocates an IP address and sets up the network interface.
2. **Kubelet**: Triggers the CNI plugin and updates the pod’s status in the API server.
3. **API Server and DNS**: Stores the pod’s IP address and updates DNS records for service discovery.

This process ensures that each pod gets a unique IP address within the cluster, enabling seamless communication and integration with other components of the Kubernetes ecosystem.

