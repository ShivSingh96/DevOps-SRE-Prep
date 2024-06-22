### OpenShift 101

**1. What is OpenShift?**
OpenShift is a family of containerization software products developed by Red Hat. It is built around Docker containers orchestrated and managed by Kubernetes, and it provides an enterprise-grade container orchestration platform.

**2. How OpenShift is related to Kubernetes?**
OpenShift builds on top of Kubernetes. It includes Kubernetes at its core for container orchestration but adds additional features and capabilities to enhance security, compliance, and ease of use for enterprise environments.

**3. True or False? OpenShift is a IaaS (infrastructure as a service) solution**
False. OpenShift is a platform as a service (PaaS) solution rather than an infrastructure as a service (IaaS) solution. It provides a higher-level abstraction for managing applications and infrastructure compared to IaaS solutions like AWS EC2 or Google Compute Engine.

**4. True or False? OpenShift CLI supports everything kubectl supports, along with additional functionality**
True. OpenShift CLI (oc) is compatible with Kubernetes CLI (kubectl) commands and includes additional functionality specific to OpenShift, such as features for building and deploying applications, managing projects, and integrating with OpenShift's security and networking features.

**5. What are some of OpenShift added features on top of Kubernetes?**
OpenShift adds several features on top of Kubernetes, including:

- **Developer and operational tooling:** Enhanced CLI (oc) with additional commands for build management, deployment strategies, and project management.
- **Security:** Role-based access control (RBAC), integrated image scanning and security policies, and enhanced network security policies.
- **Developer experience:** Integrated CI/CD pipelines, developer consoles, and application templates for quick deployment.
- **Service mesh integration:** Built-in Istio for advanced traffic management, telemetry, and policy enforcement.
- **Operator Framework:** Simplifies management and operation of complex applications on OpenShift.

**6. True or False? To run containers on OpenShift, you have to own root privileges**
False. OpenShift supports running containers without requiring root privileges for users. It uses a more secure approach to manage containers and Kubernetes resources, leveraging user identities and access controls effectively.

OpenShift enhances Kubernetes by adding enterprise features and tooling, making it easier to manage and secure containerized applications in production environments.

### OpenShift - Architecture

**1. What types of nodes OpenShift has?**
OpenShift has several types of nodes, each serving different roles in the cluster:
- **Master Nodes:** Control plane components that manage the cluster, including API server, scheduler, controller manager, and etcd.
- **Worker Nodes:** Also known as compute nodes, these nodes run application workloads in the form of pods.
- **Infrastructure Nodes:** Specialized nodes for running infrastructure components such as routers, registries, or any other OpenShift-specific services.

**2. Which component is responsible for determining pod placement?**
The **scheduler** component in OpenShift (which is an enhanced version of Kubernetes scheduler) is responsible for determining pod placement based on resource requirements, affinity/anti-affinity rules, and other constraints.

**3. What else is the scheduler responsible for except pod placement?**
In addition to pod placement, the scheduler in OpenShift (similar to Kubernetes) is responsible for:
- Ensuring high availability by spreading pods across nodes.
- Optimizing resource utilization by considering resource requests and limits.
- Handling node failures and pod rescheduling.
- Enforcing policies such as affinity, anti-affinity, and resource quotas.

### OpenShift - Hands-On Basics

**1. OpenShift supports many resources. How to get a list of all these resources?**
You can get a list of all resources supported by OpenShift by using the following command:
```bash
oc api-resources
```
This command lists all the available resource types that can be managed via the OpenShift API.

**2. Explain OpenShift CLIs like oc and odo:**
- **oc (OpenShift Client):** This CLI tool is used for interacting with OpenShift clusters. It is similar to `kubectl` in Kubernetes but includes additional functionality specific to OpenShift. `oc` can be used for managing projects, builds, deployments, services, pods, and more. It supports tasks like creating, editing, deleting resources, and managing user roles.

- **odo (OpenShift Do):** odo is a CLI tool specifically designed for developers to streamline the process of application development on OpenShift. It simplifies the workflow for creating, building, and deploying applications, focusing on iterative development and continuous delivery. odo abstracts away the complexities of Kubernetes and OpenShift resources, allowing developers to focus more on code and less on infrastructure.

Both `oc` and `odo` are powerful tools that cater to different aspects of managing and developing applications on OpenShift, providing a comprehensive interface for developers and administrators alike.

### OpenShift - Architecture

**1. What types of nodes OpenShift has?**
OpenShift has several types of nodes, each serving different roles in the cluster:
- **Master Nodes:** Control plane components that manage the cluster, including API server, scheduler, controller manager, and etcd.
- **Worker Nodes:** Also known as compute nodes, these nodes run application workloads in the form of pods.
- **Infrastructure Nodes:** Specialized nodes for running infrastructure components such as routers, registries, or any other OpenShift-specific services.

**2. Which component is responsible for determining pod placement?**
The **scheduler** component in OpenShift (which is an enhanced version of Kubernetes scheduler) is responsible for determining pod placement based on resource requirements, affinity/anti-affinity rules, and other constraints.

**3. What else is the scheduler responsible for except pod placement?**
In addition to pod placement, the scheduler in OpenShift (similar to Kubernetes) is responsible for:
- Ensuring high availability by spreading pods across nodes.
- Optimizing resource utilization by considering resource requests and limits.
- Handling node failures and pod rescheduling.
- Enforcing policies such as affinity, anti-affinity, and resource quotas.

### OpenShift - Hands-On Basics

**1. OpenShift supports many resources. How to get a list of all these resources?**
You can get a list of all resources supported by OpenShift by using the following command:
```bash
oc api-resources
```
This command lists all the available resource types that can be managed via the OpenShift API.

**2. Explain OpenShift CLIs like oc and odo:**
- **oc (OpenShift Client):** This CLI tool is used for interacting with OpenShift clusters. It is similar to `kubectl` in Kubernetes but includes additional functionality specific to OpenShift. `oc` can be used for managing projects, builds, deployments, services, pods, and more. It supports tasks like creating, editing, deleting resources, and managing user roles.

- **odo (OpenShift Do):** odo is a CLI tool specifically designed for developers to streamline the process of application development on OpenShift. It simplifies the workflow for creating, building, and deploying applications, focusing on iterative development and continuous delivery. odo abstracts away the complexities of Kubernetes and OpenShift resources, allowing developers to focus more on code and less on infrastructure.

Both `oc` and `odo` are powerful tools that cater to different aspects of managing and developing applications on OpenShift, providing a comprehensive interface for developers and administrators alike.

### OpenShift - Projects

**1. What is a project in OpenShift?**
In OpenShift, a project is a Kubernetes namespace with additional annotations and management capabilities. It serves as a way to group and isolate applications, services, and other resources within a multi-tenant OpenShift cluster. Projects provide boundaries for resource usage, access control, and visibility, allowing teams to work independently and securely within the same cluster.

**2. How to list all projects? What does the "STATUS" column mean in projects list output?**
To list all projects in OpenShift, you can use the `oc get projects` command:
```bash
oc get projects
```
The "STATUS" column in the output indicates the current status of each project. Possible statuses include:
- **Active**: The project is active and running.
- **Terminating**: The project is in the process of being deleted.
- **Terminated**: The project has been deleted.

**3. Assigning the "admin" role to a new team member on your project:**
To assign the "admin" role to a new team member on your project in OpenShift, you can use the `oc adm policy` command with the `add-role-to-user` subcommand:
```bash
oc adm policy add-role-to-user admin <username> -n <project-name>
```
Replace `<username>` with the username of the new team member and `<project-name>` with the name of your project.

### OpenShift - Applications

**1. How to create a MySQL application using an image from Docker Hub?**
To create a MySQL application using an image from Docker Hub in OpenShift, you can use the `oc new-app` command:
```bash
oc new-app mysql:latest
```
This command creates a new application using the latest MySQL image from Docker Hub. OpenShift automatically creates necessary resources like deployments, services, and pods based on the provided image.

### OpenShift - Images

**1. What is an image stream?**
An image stream in OpenShift is an abstraction that represents a sequence of related container images over time. It allows users to maintain a reference to a logically named image that can point to different versions, tags, or even external registries. Image streams provide features like automatic image updates, rollback capabilities, and integration with build triggers and deployments.

**2. Best way to run and manage multiple OpenShift environments:**
To efficiently run and manage multiple OpenShift environments, consider using OpenShift's built-in capabilities for managing clusters and projects. Key practices include:
- **Using Projects:** Organize applications and resources into projects for isolation and management.
- **Deploying Templates:** Use OpenShift templates to define reusable application stacks that can be deployed across different environments.
- **Automation:** Use CI/CD pipelines and GitOps practices to automate deployment and configuration changes.
- **Monitoring and Logging:** Set up monitoring and logging across environments to ensure visibility and maintain performance.

### OpenShift - Federation

**1. What is OpenShift Federation?**
OpenShift Federation is a feature that enables the management and coordination of multiple OpenShift clusters as a single entity. It provides centralized management, visibility, and control across geographically distributed clusters, allowing organizations to scale their containerized applications seamlessly.

**2. Explain the following in regards to Federation:**
- **Multi Cluster:** Refers to the capability of managing multiple OpenShift clusters from a single control plane, providing a unified view and management interface.
- **Federated Cluster:** A federated cluster is a logical grouping of multiple OpenShift clusters that are managed together using federation. It allows administrators to define policies, deploy applications, and enforce governance across multiple clusters.
- **Host Cluster:** The host cluster in a federated setup is the primary cluster where the federation control plane is hosted. It manages and coordinates actions across all federated clusters.
- **Member Cluster:** Member clusters are the individual OpenShift clusters that are federated together under the control of the host cluster. They maintain their autonomy while participating in the federation for centralized management purposes.

OpenShift Federation simplifies the operational complexity of managing distributed Kubernetes environments, providing a unified approach to scalability, resilience, and application deployment across clusters.

### OpenShift - Storage

**1. What is a storage device? What storage devices are there?**
A storage device is a hardware or virtual device used to store data persistently. In the context of OpenShift, storage devices can include:
- **Block Storage:** Storage that manages data in fixed-size blocks, typically used by applications that require direct access to raw storage devices.
- **File Storage:** Storage that organizes data into files and folders, suitable for applications that require file system semantics.
- **Object Storage:** Storage that manages data as objects, with metadata and a unique identifier, suitable for storing and retrieving large amounts of unstructured data.

**2. What is Random Seek Time?**
Random Seek Time is the average time it takes for a storage device to position its read/write heads to a specific location on the disk. It measures the latency associated with accessing data in a non-sequential manner.

### OpenShift - Pods

**1. What happens when a pod fails or exits due to a container crash?**
When a pod fails or a container within a pod crashes, OpenShift attempts to restart the pod according to its restart policy. The pod may enter a "CrashLoopBackOff" state if it continues to fail after restart attempts. OpenShift logs events related to pod failures, which can be useful for troubleshooting.

**2. What happens when a pod fails too often?**
If a pod fails too often within a short period, OpenShift may apply backoff strategies defined by the pod's restart policy. These strategies control the frequency and number of restart attempts. Administrators can configure liveness and readiness probes to monitor pod health and determine when to restart pods automatically.

**3. How to find out on which node a certain pod is running?**
To find out on which node a certain pod is running in OpenShift, you can use the `oc get pod <pod-name> -o wide` command. This command provides detailed information about the pod, including the node name under the "NODE" column.

### OpenShift - Services

**1. Explain Services and their benefits**
Services in OpenShift provide an abstraction layer that allows pods to be accessed consistently using a stable IP address or DNS name, regardless of the pods' actual locations or lifecycle changes. Key benefits of using services include:
- **Load Balancing:** Services distribute traffic across multiple pod instances for scalability and availability.
- **Service Discovery:** Applications can discover and communicate with other services using DNS or environment variables.
- **Internal Networking:** Services enable communication between pods within the same project or across projects within an OpenShift cluster.
- **External Access:** Services can be exposed externally via routes to allow access from outside the OpenShift cluster.

### OpenShift - Labels

**1. Explain labels. What are they? When do you use them?**
Labels in OpenShift are key-value pairs attached to resources like pods, services, deployments, and nodes. They are used to organize and select subsets of resources based on their characteristics or metadata. Common use cases for labels include:
- **Organizational:** Grouping resources based on teams, environments, or applications.
- **Operational:** Tagging resources with deployment stages (e.g., production, staging, development).
- **Policy Enforcement:** Applying security policies or access controls based on labels.
- **Automation:** Defining selectors for deployments, services, and other controllers to manage subsets of resources.

### OpenShift - Service Accounts

**1. How to list Service Accounts?**
To list Service Accounts in OpenShift, you can use the `oc get serviceaccounts` command:
```bash
oc get serviceaccounts
```
This command displays a list of all service accounts in the current project.

### OpenShift - Networking

**1. What is a Route?**
A Route in OpenShift is an object that exposes a service at a hostname, like `http://example.com`, and enables external access to applications running within OpenShift clusters. Routes provide HTTP and HTTPS routing capabilities to direct traffic to specific services or pods based on rules defined by the user.

**2. What is a Route consists of?**
A Route in OpenShift consists of:
- **Host:** The hostname at which the service is exposed externally.
- **Path:** An optional URL path to further direct traffic within the route.
- **Service:** The internal service or pod that the route points to.
- **TLS Termination:** Optional settings for terminating TLS (HTTPS) traffic at the router.

**3. True or False? Router container can run only on the Master node**
False. In OpenShift, the router (which manages routes and ingress traffic) can run on any node in the cluster where it is scheduled. It is not restricted to running only on the master node.

**4. Given an example of how a router is used**
An example of using a router in OpenShift:
```yaml
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: my-route
spec:
  to:
    kind: Service
    name: my-service
    weight: 100
  host: example.com
  path: /api
```
This example defines a route named `my-route` that directs traffic from `example.com/api` to the `my-service` service within the OpenShift cluster.

### OpenShift - Security

**1. What are "Security Context Constraints"?**
Security Context Constraints (SCCs) in OpenShift are policies that control and restrict the actions pods can perform and the permissions they have within the cluster. SCCs define security settings such as:
- **Run As User:** Specifies the user ID under which containers are run.
- **SELinux Context:** Enforces SELinux context constraints.
- **Capabilities:** Limits the Linux kernel capabilities available to containers.
- **Volume Types:** Restricts the types of volumes that can be mounted by pods.

**2. How to add the ability for the user `user1` to view the project `wonderland` assuming you are authorized to do so**
To add view permissions for `user1` to the project `wonderland`, you can use the `oc policy` command:
```bash
oc policy add-role-to-user view user1 -n wonderland
```
This command grants the `view` role to `user1` within the `wonderland` project, allowing them to list and view resources in the project.

**3. How to check what is the current context?**
To check the current context in OpenShift, use the `oc whoami` command:
```bash
oc whoami
```
This command displays the username associated with the current context in OpenShift.

### OpenShift - Serverless

**1. What is OpenShift Serverless?**
OpenShift Serverless is a platform feature that enables developers to deploy and run serverless applications and functions on OpenShift Kubernetes clusters without managing the underlying infrastructure. It simplifies the deployment and scaling of event-driven applications by automatically managing resources based on demand.

**2. What are some of the event sources you can use with OpenShift Serverless?**
OpenShift Serverless supports various event sources for triggering serverless functions, including:
- **HTTP Requests:** Triggering functions via HTTP requests.
- **Kafka:** Consuming messages from Kafka topics.
- **CronJobs:** Executing functions based on a cron schedule.
- **OpenShift Events:** Reacting to events within the OpenShift cluster.

**3. Explain serverless functions**
Serverless functions in OpenShift are small pieces of code or applications that are executed in response to events or triggers without the need for maintaining server infrastructure. They are typically short-lived, stateless, and scale automatically based on demand. Serverless functions can be written in languages like Python, Node.js, or Java and are deployed as lightweight containers.

**4. What is the difference between Serverless Containers and Serverless functions?**
- **Serverless Containers:** Refers to running containerized applications in a serverless manner where the infrastructure is managed automatically, and resources scale dynamically based on demand. These containers can be long-running and stateful.
- **Serverless Functions:** Refers to short-lived, event-driven functions that execute in response to specific triggers or events. They are typically stateless and are well-suited for event-driven architectures and microservices.

### OpenShift - Misc

**1. What is Replication Controller?**
In OpenShift, as in Kubernetes, a Replication Controller is a Kubernetes resource that ensures a specified number of pod replicas are running at any given time. It monitors the state of pods and automatically replaces any pods that fail or terminate, maintaining the desired number of replicas. Replication Controllers are used for ensuring high availability, load balancing, and scaling applications horizontally.

