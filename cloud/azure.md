### Azure 101

#### Azure Portal
Azure Portal is the web-based management interface provided by Microsoft Azure. It serves as a unified portal for administrators, developers, and users to manage and monitor their Azure resources and services. Through the Azure Portal, users can perform tasks such as provisioning resources, monitoring performance, setting up alerts, managing access control, and configuring Azure services.

#### Azure Marketplace
Azure Marketplace is an online store for discovering, trying, and deploying applications and services certified to run on Azure. It offers a wide range of solutions including virtual machine images, software applications, developer tools, and managed services from both Microsoft and third-party providers. Users can browse categories, read reviews, and quickly deploy solutions to their Azure subscriptions directly from the Azure Marketplace.

#### Availability Sets and Availability Zones
- **Availability Sets**: Availability Sets in Azure are logical groupings of virtual machines (VMs) that are deployed across fault domains and update domains. Fault domains represent groups of hardware in a datacenter that share a common power source and network switch, minimizing the likelihood of simultaneous failure due to hardware issues. Update domains are used to control the order in which VMs are updated during planned maintenance events, ensuring that not all VMs in an availability set are updated at the same time. By placing VMs in an availability set, Azure ensures that the VMs are distributed across different physical hardware to minimize downtime during maintenance events or unplanned outages.
  
- **Availability Zones**: Availability Zones are physically separate datacenters within an Azure region. Each Availability Zone has independent power, cooling, and networking infrastructure, reducing the risk of a single point of failure. Azure customers can deploy resources (such as VMs, storage, and databases) across multiple Availability Zones to achieve higher availability and fault tolerance for their applications.

#### Azure Policy
Azure Policy is a service in Azure that allows organizations to create, assign, and manage policies to enforce rules and regulations on Azure resources. Azure Policy helps ensure compliance with corporate standards and regulatory requirements by evaluating resources for non-compliance and automatically remediating them. Policies can enforce rules related to resource properties, such as allowed regions, tagging requirements, resource types, and more. Azure Policy can be applied at the subscription level, resource group level, or individual resources.

#### Azure Managed Disks
Azure Managed Disks are persistent, scalable, and high-performance block storage disks for Azure virtual machines (VMs). Managed Disks simplify disk management by handling storage account management tasks internally and providing features such as built-in redundancy, automatic encryption, and integration with Azure Backup and Azure Site Recovery for disaster recovery. Managed Disks come in several types (Standard HDD, Standard SSD, Premium SSD) and can be easily scaled up in size or performance without downtime.

These components form essential parts of the Azure ecosystem, providing foundational capabilities for deploying, managing, securing, and ensuring compliance within Azure environments.

### Azure Resource Manager (ARM)

#### Azure Resource Manager (ARM)
Azure Resource Manager (ARM) is the deployment and management service provided by Microsoft Azure that allows you to manage and organize resources in your Azure environment. It provides a unified management layer that enables you to deploy, manage, and monitor all Azure resources as a group rather than individually. ARM enables you to work with resources such as virtual machines, storage accounts, databases, virtual networks, and more in a cohesive manner.

#### ARM Template Sections
ARM templates are JSON files that define the infrastructure and configuration of Azure resources. They consist of several key sections:

1. **Schema**: Specifies the version of the Azure Resource Manager schema that the template uses.
   
2. **Content Version**: Indicates the version of the template. This is typically used for version control and tracking changes.

3. **Parameters**: Defines values that are provided when deploying the template. Parameters allow you to customize the deployment without modifying the template itself.

4. **Variables**: Optional section that defines values that are reused throughout the template. Variables can simplify template maintenance by centralizing values used in multiple places.

5. **Resources**: Specifies the Azure resources to deploy or update. Each resource is defined with its type, name, API version, properties, and dependencies.

6. **Outputs**: Optional section that defines values that are returned after the template is deployed. Outputs can include resource IDs, connection strings, URLs, etc., which can be useful for post-deployment tasks or for linking resources together.

#### Azure Resource Group
An Azure Resource Group is a logical container that holds related resources for an Azure solution. When you deploy resources through Azure Resource Manager, you deploy them into a resource group. Resource groups can include resources from multiple Azure regions, but they must reside in the same Azure subscription. Key characteristics of Azure Resource Groups include:

- **Management Scope**: Resource groups provide a scope for applying lifecycle management operations such as deploying, updating, and deleting resources together.
  
- **Access Control**: Azure Resource Groups can have access control (IAM) applied at the resource group level, allowing you to control who can access and manage the resources within the group.
  
- **Tagging and Billing**: Tags applied to a resource group are inherited by the resources within it, simplifying cost allocation and management for billing purposes.
  
- **Resource Group Lifecycle**: Resources within a resource group share the same lifecycle, making it easier to manage and maintain related resources together.

Resource groups are a fundamental organizational construct in Azure, providing a way to manage and monitor resources as a unit, control access, and apply policies consistently across related resources. They are commonly used to group resources for applications, environments (like development, testing, production), or organizational departments.

### Azure Compute Services

#### Azure Virtual Machines
Azure Virtual Machines (VMs) is a service that provides scalable computing capacity in the cloud. It allows you to create and deploy virtual machines on Azure's infrastructure. Key features include:

- **Flexibility**: Choose from a wide range of VM sizes and types (Windows/Linux) to meet specific workload requirements.
- **Scalability**: Scale VMs vertically (resizing) or horizontally (load balancing and scale sets).
- **Customization**: Install and configure applications, manage operating system settings, and control networking environment.
- **Integration**: Integrate with other Azure services like Azure Storage, Azure Virtual Network, and more.

#### Azure Virtual Machine Scale Sets
Azure Virtual Machine Scale Sets (VMSS) allows you to deploy and manage a group of identical VMs. It provides scalability and high availability for your applications, automatically adjusting the number of VM instances based on demand or a defined schedule. Key features include:

- **Automatic Scaling**: VMSS automatically adds or removes VM instances based on load metrics or schedule, ensuring optimal performance and cost efficiency.
- **Fault Tolerance**: Distributed across multiple fault domains to ensure availability during hardware failures or planned maintenance events.
- **Integrated Load Balancing**: Traffic distribution among VM instances is managed through Azure Load Balancer, ensuring even load distribution across instances.

#### Azure Functions
Azure Functions is a serverless compute service that allows you to run event-triggered code (functions) without managing infrastructure. Key features include:

- **Event-driven**: Execute code in response to events from Azure services, HTTP requests, timers, or message queues (like Azure Queue Storage or Service Bus).
- **Scalable**: Automatically scale based on demand, processing incoming events concurrently.
- **Pay-per-use**: You only pay for the compute resources consumed by the function executions, billed based on the number of executions and execution time.
- **Integration**: Easily integrate with other Azure services and third-party services through bindings and triggers.

#### Durable Azure Functions
Durable Azure Functions (Durable Functions) is an extension of Azure Functions that allows you to write stateful serverless workflows. Key features include:

- **Stateful Orchestrations**: Coordinate and manage long-running workflows with state checkpoints and retries, enabling reliable execution of complex workflows.
- **Durable Entities**: Manage stateful objects (entities) within Durable Functions, allowing shared state management across function invocations.
- **Easily Composable**: Built-in support for chaining functions, parallel execution, and human interaction patterns (like approval workflows or timeouts).

Durable Functions simplify the development of complex event-driven and stateful workflows in serverless environments, providing resilience and scalability without managing infrastructure.

### Azure Compute Services

#### Azure Container Instances
Azure Container Instances (ACI) is a service that allows you to run containers on Azure without managing underlying virtual machines. Key features include:

- **Serverless**: Run containers without provisioning or managing VMs, paying only for the containers' compute resources.
- **Rapid Deployment**: Quickly deploy containers using Docker images or Azure Container Registry.
- **Isolation and Security**: Each container instance runs in its own secure environment, ensuring isolation and security boundaries.
- **Integration**: Easily integrate with other Azure services and orchestration tools like Azure Kubernetes Service (AKS) or Azure Container Service.

#### Azure Batch
Azure Batch is a cloud-based job scheduling service that allows you to run large-scale parallel and high-performance computing (HPC) applications efficiently in Azure. Key features include:

- **Job Scheduling**: Automatically schedule and manage jobs across a pool of virtual machines, optimizing resources based on workload demands.
- **Scalability**: Scale resources up or down based on demand, processing large-scale computations or data processing tasks efficiently.
- **Integration**: Integrate with Azure services like Azure Storage, Azure Virtual Network, and third-party HPC applications.
- **Batch AI**: Specialized support for running AI training and inference workloads at scale.

#### Azure Service Fabric
Azure Service Fabric is a distributed systems platform that simplifies building and managing scalable, reliable, and easily upgradeable microservices and container-based applications. Key features include:

- **Microservices Architecture**: Build and deploy microservices-based applications with stateful or stateless services.
- **Reliability and Scalability**: Automatically manage application lifecycle, including scaling, health monitoring, and failover.
- **Programming Models**: Support for multiple programming languages and frameworks (including .NET, Java, Node.js, etc.).
- **Integration**: Seamlessly integrate with Azure services and on-premises infrastructure, providing flexibility in deployment options.

#### Azure Kubernetes Service (AKS)
Azure Kubernetes Service (AKS) is a managed Kubernetes service that simplifies deploying, managing, and scaling containerized applications using Kubernetes orchestration. Key features include:

- **Kubernetes Orchestration**: Deploy and manage containerized applications using Kubernetes, an open-source container orchestration platform.
- **Scalability and Availability**: Automatically scale applications based on demand and ensure high availability with multiple nodes and fault-tolerant architecture.
- **Integrated Monitoring**: Monitor application performance, container health, and cluster metrics using Azure Monitor and other monitoring tools.
- **Integration**: Seamless integration with other Azure services, including Azure Active Directory, Azure Container Registry, and more.

AKS provides enterprise-grade security, reliability, and operational efficiency for deploying and managing containerized applications on Azure.

### Azure Network Services

#### Azure Network Services Familiarity
I'm familiar with several Azure network services, including:

1. **Azure Virtual Network (VNet)**: Allows creation of isolated networks in Azure, with control over IP addresses, DNS settings, security policies, and route tables.
   
2. **Azure ExpressRoute**: Provides dedicated private connections between Azure data centers and on-premises infrastructure or colocation environments, offering higher security and reliability for hybrid cloud deployments.

3. **Azure Load Balancer**: Distributes incoming traffic across multiple instances to ensure high availability and scale applications.

4. **Azure VPN Gateway**: Provides secure, encrypted cross-premises connectivity between Azure virtual networks and on-premises networks.

5. **Azure Application Gateway**: Provides application-level routing and load balancing services that let you build a scalable and highly-available web frontend.

#### VNet Peering
**VNet peering** in Azure enables connecting two VNets within the same Azure region through Azure's backbone network. Key aspects of VNet peering include:

- **Private Connectivity**: Allows VNets to communicate securely without traffic flowing over the public internet.
- **Transitive Routing**: Enables seamless connectivity even if the VNets are connected through other VNets (transitive peering).
- **Low Latency**: Traffic between peered VNets travels over Microsoft's backbone network, ensuring low latency and high bandwidth.

#### Azure Region
An **Azure region** is a geographical area where Azure resources are deployed and hosted. Each Azure region consists of one or more data centers, with redundant power, networking, and cooling infrastructure to ensure high availability and resilience. Azure regions are interconnected through Microsoft's global network backbone, allowing data and applications to be replicated and moved between regions as needed.

#### N-Tier Architecture
**N-tier architecture** is a design pattern for dividing an application into separate layers (tiers), each handling a specific set of responsibilities and tasks. Common tiers in an N-tier architecture include:

1. **Presentation Tier (UI)**: Handles user interaction and presentation of data.
2. **Application Tier (Business Logic)**: Implements business rules and processes logic.
3. **Data Tier (Database)**: Manages data storage and retrieval.
4. **Services Tier (Middleware)**: Provides integration and communication between different layers and external systems.

N-tier architecture promotes modularity, scalability, and maintainability by separating concerns and providing clear boundaries between different layers of an application.

### Azure Storage Services and Options

#### Azure Storage Services Familiarity
I'm familiar with several Azure storage services, including:

1. **Azure Blob Storage**: Stores unstructured data such as documents, images, videos, and logs.
   
2. **Azure File Storage**: Provides fully managed file shares in the cloud that can be accessed via the SMB protocol.

3. **Azure Table Storage**: NoSQL key-value store for structured datasets that require fast access times.

4. **Azure Queue Storage**: Provides messaging between application components for communication and coordination.

#### Azure Storage Options
Azure supports various storage options to cater to different needs and scenarios:

1. **Blob Storage**: Ideal for storing large amounts of unstructured data like text or binary data. Supports hot, cool, and archive access tiers.

2. **File Storage**: Managed file shares for cloud or hybrid environments, accessible via the SMB protocol.

3. **Table Storage**: NoSQL key-value store for storing structured datasets.

4. **Queue Storage**: Messaging service for reliable messaging between application components.

5. **Disk Storage**: Managed disks for Azure Virtual Machines, offering both HDDs and SSDs with different performance characteristics.

6. **Premium Storage**: High-performance SSD-based storage for I/O-intensive workloads.

7. **Archive Storage**: Low-cost storage solution for rarely accessed data, suitable for compliance and regulatory requirements.

Azure storage options provide flexibility in terms of performance, cost-effectiveness, and scalability to meet diverse application and business requirements.

### Azure Security Center

**Azure Security Center** is a unified security management system that provides advanced threat protection across Azure and hybrid cloud workloads. Some of its key features include:

1. **Security Policies**: Allows organizations to define and enforce security policies across Azure subscriptions and resources to ensure compliance with regulatory requirements and security best practices.

2. **Security Alerts**: Monitors resources in real-time and provides alerts for potential security vulnerabilities or threats detected in Azure environments.

3. **Recommendations**: Offers actionable security recommendations based on best practices to improve the security posture of Azure resources.

4. **Security Policies**: Enables organizations to create and manage security policies to ensure compliance with regulatory requirements and internal security standards.

5. **Threat Protection**: Provides advanced threat detection capabilities using machine learning and behavioral analytics to identify and respond to suspicious activities and potential breaches.

6. **Integration with Azure Defender**: Automatically enables Azure Defender (formerly known as Azure Security Center Standard) for enhanced threat detection and protection across Azure resources, including virtual machines, databases, containers, and more.

### Azure Active Directory (Azure AD)

**Azure Active Directory (Azure AD)** is Microsoft's cloud-based identity and access management service. It provides:

1. **Single Sign-On (SSO)**: Users can access multiple applications with a single set of credentials.

2. **Identity Protection**: Detects potential vulnerabilities affecting user identities and takes automated actions to mitigate risks.

3. **Access Management**: Provides centralized access control to applications and resources based on user identities and group memberships.

4. **Multi-Factor Authentication (MFA)**: Adds an extra layer of security by requiring additional verification methods during sign-in.

5. **Application Management**: Simplifies the management of cloud and on-premises applications through Azure AD App registrations and integrations.

### Azure Advanced Threat Protection (Azure ATP)

**Azure Advanced Threat Protection (Azure ATP)** is a cloud-based security solution that identifies, detects, and helps organizations investigate advanced threats and compromised identities in real-time. It includes:

1. **User and Entity Behavior Analytics (UEBA)**: Analyzes user activities and behaviors to detect suspicious actions indicative of advanced threats.

2. **Threat Intelligence**: Leverages Microsoft's extensive threat intelligence capabilities to identify known malicious IPs, domains, and URLs.

3. **Integration with Microsoft Defender for Identity**: Formerly known as Azure ATP, this integration provides insights into suspicious activities related to identity and access within on-premises Active Directory environments.

4. **Incident Response**: Provides actionable recommendations and guidance to investigate and remediate identified security incidents.

### Azure ATP Components

Components of Azure ATP include:

1. **Azure ATP Portal**: Web-based interface for monitoring and investigating security alerts and incidents.

2. **Azure ATP Sensor**: Lightweight software installed on domain controllers to capture and analyze network traffic and user activities.

3. **Microsoft Defender for Identity**: An on-premises component that extends Azure ATP capabilities to detect and respond to advanced threats targeting identity and access.

### Azure Monitor Logs

**Azure Monitor Logs** store log data generated by Azure services and resources. Logs are stored in **Log Analytics Workspaces**, which are Azure resources that collect, analyze, and store log data from various sources, including:

- **Azure Virtual Machines**
- **Azure Active Directory**
- **Azure Security Center**
- **Azure App Service**
- **Azure Storage**
- **Azure SQL Database**
- **Azure Kubernetes Service (AKS)**

Logs stored in Azure Monitor can be used for monitoring, troubleshooting, auditing, and creating custom dashboards and alerts based on specific metrics and events.

### Azure Site Recovery (ASR)

**Azure Site Recovery (ASR)** is a disaster recovery solution that allows organizations to protect and recover their on-premises and Azure virtual machines, applications, and workloads in the event of a site outage or disaster. Key features and capabilities of Azure Site Recovery include:

1. **Replication**: Replicates on-premises physical servers and virtual machines to Azure or between Azure regions for disaster recovery purposes.

2. **Orchestration and Automation**: Provides automated failover and failback processes to ensure minimal downtime and data loss during disaster recovery scenarios.

3. **Site Recovery Plans**: Defines and orchestrates the sequence of actions to recover applications and workloads in Azure or on-premises environments.

4. **Health Monitoring and Reporting**: Monitors the replication health and status of protected instances, with built-in monitoring and reporting capabilities for ongoing management and compliance.

5. **Integration with Azure**: Seamlessly integrates with Azure Virtual Machines, Azure VM Scale Sets, Azure SQL Database, and other Azure services to provide comprehensive disaster recovery and business continuity solutions.

Azure Site Recovery helps organizations maintain business continuity by ensuring the availability and resilience of critical applications and workloads during planned and unplanned disruptions.

### Azure Advisor

**Azure Advisor** is a personalized cloud consultant that helps optimize Azure resources for performance, security, high availability, and cost-efficiency. It provides recommendations based on Azure best practices and analyzes resource configurations, usage patterns, and telemetry data to offer actionable insights. Azure Advisor covers the following areas:

1. **Cost**: Recommends ways to optimize Azure spending by identifying unused or underutilized resources, suggesting reserved instances for cost savings, and providing cost estimates for scaling resources.

2. **Performance**: Offers guidance on improving the performance of Azure services and workloads by analyzing resource configurations, monitoring metrics, and identifying bottlenecks.

3. **High Availability**: Provides recommendations to enhance the availability and reliability of Azure services by suggesting configurations for redundancy, fault tolerance, and disaster recovery.

4. **Security**: Advises on security best practices and configurations to strengthen the security posture of Azure resources, including recommendations for network security groups, encryption settings, and access controls.

5. **Operational Excellence**: Recommends operational improvements such as automating tasks, implementing monitoring and alerting, and optimizing resource management practices.

### Health Probe Protocols

In Azure Load Balancer, the following health probe protocols are available for configuring health probes:

1. **HTTP**: Health probes can use HTTP protocol to send HTTP requests to a specified path on the target virtual machine or endpoint. The load balancer checks for valid HTTP responses (200-399 status codes) to determine the health of the endpoint.

2. **HTTPS**: Similar to HTTP probes, but using HTTPS for secure communication. HTTPS probes validate SSL certificates and check for valid HTTPS responses from the target endpoints.

3. **TCP**: Health probes can use TCP protocol to establish a TCP connection to the target virtual machine or endpoint on a specified port. The load balancer verifies that the TCP connection is successfully established to determine the health of the endpoint.

4. **UDP**: For scenarios where UDP traffic is used, health probes can send UDP packets to a specified port on the target virtual machine or endpoint. The load balancer monitors for responses or packet acknowledgments to determine the health status.

### Azure Active Directory (Azure AD)

**Azure Active Directory (Azure AD)** is Microsoft's cloud-based identity and access management service. It provides:

- **Identity Services**: Securely manages user identities and provides seamless access to applications and resources.
- **Access Management**: Centralized control over access to applications and resources based on user identities and group memberships.
- **Single Sign-On (SSO)**: Enables users to access multiple applications with a single set of credentials.
- **Multi-Factor Authentication (MFA)**: Adds an extra layer of security by requiring additional verification methods during sign-in.
- **Application Management**: Simplifies the management of cloud and on-premises applications through Azure AD App registrations and integrations.

### Azure Subscription

**Azure Subscription** is a logical container used to provision Azure resources. It provides access to Azure services and resources and defines the billing scope for Azure usage. There are several types of Azure subscriptions:

1. **Free Trial**: Provides a limited period (typically 12 months) of free Azure services and credits to explore Azure capabilities without incurring costs.

2. **Pay-As-You-Go**: Charges are based on actual usage of Azure services, with no upfront commitment. It is suitable for individuals and small businesses getting started with Azure.

3. **Enterprise Agreement (EA)**: For larger organizations, EA provides discounted pricing and terms for Azure services based on volume and commitment.

4. **Student**: Designed for students and academic institutions to access Azure resources at no cost or with educational discounts.

5. **Microsoft Partner Network (MPN)**: Available for Microsoft partners, providing internal use rights (IUR) to Azure services for business operations and development.

### Azure Blob Storage

**Azure Blob Storage** is a scalable object storage service that allows you to store and manage unstructured data in the cloud. It is suitable for a wide range of data types, including documents, images, videos, logs, backups, and large datasets. Key features of Azure Blob Storage include:

- **Blob Types**: Supports three types of blobs: Block blobs (for general-purpose storage), Append blobs (for append-only operations), and Page blobs (for random access to data).

- **Data Redundancy**: Offers built-in redundancy options (Locally Redundant Storage, Zone-Redundant Storage, Geo-Redundant Storage, and Read-Access Geo-Redundant Storage) to ensure data durability and availability.

- **Security**: Provides encryption at rest and in transit, integration with Azure Active Directory for authentication and access control, and role-based access control (RBAC) for fine-grained permissions.

- **Scalability**: Scales up to store petabytes of data, with support for automatic scaling and management of data growth.

- **Access Tiers**: Offers hot, cool, and archive access tiers to optimize storage costs based on data access patterns and retrieval requirements.

Azure Blob Storage is widely used for backup and restore, big data analytics, content delivery, and as a persistent storage layer for cloud-native applications deployed on Azure.

