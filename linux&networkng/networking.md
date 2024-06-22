### Network Basics

**Communication Necessities**: To communicate, you need at least two entities capable of sending and receiving data, typically over a network.

**TCP/IP**: TCP/IP (Transmission Control Protocol/Internet Protocol) is the suite of protocols that governs how data is transmitted and received over the Internet and other networks. It provides end-to-end connectivity specifying how data should be formatted, addressed, transmitted, routed, and received.

**Ethernet**: Ethernet is a standard protocol that defines rules for configuring networks and physically wiring them. It operates at the Data Link Layer (Layer 2) of the OSI model and is used for local area networks (LANs).

**MAC Address**: A MAC (Media Access Control) address is a unique identifier assigned to network interfaces for communications at the Data Link Layer of the OSI model. It is used for addressing devices within a network segment. The address `ff:ff:ff:ff:ff:ff` is the broadcast address, meaning it is used to send data to all devices on the same network segment.

**IP Address**: An IP (Internet Protocol) address is a numerical label assigned to each device connected to a computer network that uses the IP for communication. It identifies the device's location on the network.

**Subnet Mask**: A subnet mask is used in conjunction with IP addresses to define the network portion and the host portion of the address. It separates the network ID from the host ID. For example, in the IP address `192.168.1.1` with subnet mask `255.255.255.0`, `192.168.1` is the network portion, and `1` is the host portion.

**Private IP Address**: A private IP address is used within a private network and is not routable on the public Internet. It's typically used for internal communications within a company or organization.

**Public IP Address**: A public IP address is globally routable on the Internet and can be accessed from anywhere on the Internet. It's used for devices and servers that need to communicate with external networks.

### OSI Model

**OSI Model**: The OSI (Open Systems Interconnection) model is a conceptual framework used to understand network communication. It consists of 7 layers:

1. **Physical Layer**: Deals with physical connections and electrical signals.
2. **Data Link Layer**: Handles data framing, error detection, and MAC addressing (Ethernet).
3. **Network Layer**: Responsible for logical addressing (IP addresses), routing, and packet forwarding.
4. **Transport Layer**: Manages end-to-end communication, reliability, and flow control (TCP/UDP).
5. **Session Layer**: Establishes, manages, and terminates sessions between applications.
6. **Presentation Layer**: Translates data into a format suitable for transmission (encryption, compression).
7. **Application Layer**: Provides network services directly to end-user applications.

**OSI Layer for Each Function**:
- Error correction: **Transport Layer**
- Packets routing: **Network Layer**
- Cables and electrical signals: **Physical Layer**
- MAC address: **Data Link Layer**
- IP address: **Network Layer**
- Terminate connections: **Transport Layer**
- 3 way handshake: **Transport Layer**

### Delivery Schemes

**Delivery Schemes**: Delivery schemes include unicast (one-to-one), multicast (one-to-many), and broadcast (one-to-all). They define how data is transmitted across networks depending on the destination.

### Network Devices

- **Router**: Connects different networks and routes packets between them based on IP addresses.
- **Switch**: Connects devices within a network and forwards data based on MAC addresses.
- **Hub**: Simplest form of network device that broadcasts data to all devices connected to it without any intelligence.

### Collision and Broadcast Domains

- **Collision Domain**: Set of network devices where packets can collide with each other if sent simultaneously. In a switch, each port is a separate collision domain.
- **Broadcast Domain**: Set of devices that receive broadcast messages from each other. In a switch, each VLAN typically represents a separate broadcast domain.

### Router and NAT

**Router**: A router forwards data packets between computer networks. It operates at the Network Layer (Layer 3) of the OSI model and uses IP addresses to determine where to send packets.

**NAT (Network Address Translation)**: NAT is a process used in routers to translate private IP addresses into public IP addresses for routing over the Internet. It allows multiple devices within a private network to share a single public IP address.

### Proxy

**Proxy**: A proxy server acts as an intermediary between clients and servers, forwarding requests and responses between them. It can be used for caching, filtering content, or enhancing security by hiding client details.

### TCP and 3-Way Handshake

**TCP (Transmission Control Protocol)**: TCP is a connection-oriented protocol that provides reliable, ordered, and error-checked delivery of data between applications over a network.

**3-Way Handshake**: It's the process used by TCP to establish a connection between two devices:
1. **SYN**: Initiates the connection from the client to the server.
2. **SYN-ACK**: Acknowledges the request and agrees to establish the connection.
3. **ACK**: Finalizes the connection establishment from the client to the server.

### Round-Trip Delay/Time

**Round-Trip Delay/Time**: Refers to the time taken for a signal to travel from the sender to the receiver and back. It includes the time spent in transmitting, propagating through the network, and processing at the destination, providing a measure of latency in network communication.

### How does an SSL handshake work?

**SSL Handshake**:
1. **Client Hello**: The client sends a message to the server indicating which cryptographic protocols and algorithms it supports.
2. **Server Hello**: The server responds with a message confirming the protocol version and selecting a cryptographic suite from those offered by the client.
3. **Authentication and Pre-Master Secret**: The server sends its digital certificate to prove its identity. The client verifies the certificate and creates a pre-master secret, encrypts it with the server's public key from the certificate, and sends it to the server.
4. **Session Keys**: Both the client and server generate session keys from the pre-master secret.
5. **Finished**: Both parties send a message encrypted with the session keys to confirm that the handshake is complete. This ensures that the handshake was not tampered with and sets the stage for encrypted data transfer.

### Difference between TCP and UDP

**TCP (Transmission Control Protocol)**:
- **Connection-Oriented**: Establishes a connection between sender and receiver before data transmission.
- **Reliability**: Provides reliable, ordered, and error-checked delivery of data packets.
- **Handshaking**: Uses a three-way handshake (SYN, SYN-ACK, ACK) to establish a connection.

**UDP (User Datagram Protocol)**:
- **Connectionless**: Does not establish a connection before sending data.
- **Unreliable**: Does not guarantee delivery of packets and does not provide acknowledgment of receipt.
- **Speed**: Generally faster than TCP due to no connection setup, teardown, or error checking.

### TCP/IP Protocols

Common TCP/IP protocols include:
- **HTTP (Hypertext Transfer Protocol)**: Application layer protocol for transferring hypermedia documents, used in web browsing.
- **FTP (File Transfer Protocol)**: Application layer protocol for transferring files between a client and server on a network.
- **SMTP (Simple Mail Transfer Protocol)**: Application layer protocol for sending email messages between servers.
- **DNS (Domain Name System)**: Application layer protocol for resolving domain names to IP addresses.
- **TCP (Transmission Control Protocol)**: Transport layer protocol responsible for reliable data transmission.
- **UDP (User Datagram Protocol)**: Transport layer protocol for connectionless communication.

### Default Gateway

**Default Gateway**:
- **Definition**: The default gateway is the router or networking device on a TCP/IP network that serves as an access point to another network or the Internet.
- **Role**: It forwards IP packets from a local network to remote networks, acting as an intermediary between devices on the local network and outside networks.

### ARP (Address Resolution Protocol)

**ARP**:
- **Definition**: ARP is a protocol used to map IP addresses to MAC addresses on a local network segment.
- **Operation**: When a device needs to send a packet to another device on the same subnet, it broadcasts an ARP request containing the IP address of the destination. The device with that IP address responds with its MAC address, allowing the sender to create an ARP table entry for future communication.

### TTL (Time-To-Live)

**TTL**:
- **Definition**: TTL is a field in IP packet headers that specifies the maximum number of hops (routers) a packet can pass through before being discarded.
- **Purpose**: It helps prevent packets from circulating indefinitely in case of routing loops or network failures, ensuring that packets do not consume excessive network resources.

### DHCP (Dynamic Host Configuration Protocol)

**DHCP**:
- **Definition**: DHCP is a network management protocol used to dynamically assign IP addresses and other network configuration parameters to devices on a network.
- **Operation**: A DHCP server automatically assigns IP addresses from a pool, along with subnet masks, default gateways, DNS server addresses, etc., to devices that request them (DHCP clients).

### Two DHCP Servers on the Same Network

- **Yes, you can have two DHCP servers on the same network**, but it requires careful configuration to avoid conflicts:
  - **Scope Segmentation**: Divide the IP address range into non-overlapping scopes assigned to different DHCP servers.
  - **Redundancy**: Configure one server as primary and the other as backup to ensure uninterrupted DHCP service if one server fails.
  - **Cooperation**: Ensure DHCP servers are configured to avoid assigning conflicting IP addresses or configuration parameters.

### SSL Tunneling

**SSL Tunneling**:
- **Definition**: SSL (Secure Sockets Layer) tunneling is a method of encapsulating traffic over an SSL connection to create a secure and private communication channel between two endpoints.
- **Purpose**: It allows data to be transmitted securely across a public network (like the Internet) by encrypting the entire communication session.
- **How It Works**: 
  - SSL tunneling starts with establishing an SSL connection between the client and server through a process like the SSL handshake.
  - Once the SSL connection is established, data packets are encapsulated in SSL/TLS (Transport Layer Security) protocol packets for secure transmission.
  - SSL tunneling can be used to securely transmit various protocols and applications over untrusted networks, providing confidentiality, integrity, and authenticity of data.

Understanding these concepts is essential for building and maintaining secure, efficient, and reliable computer networks.

### What is a socket? Where can you see the list of sockets in your system?

**Socket**:
- A socket is a software endpoint that establishes communication between two computers over a network. It enables programs (processes) to communicate with each other, either on the same computer or across a network.

**Viewing Sockets**:
- On Unix-like systems (Linux, macOS), you can use the `netstat` command to view open sockets and related network information.
- Example command: `netstat -an | grep LISTEN`
- This command shows listening sockets (sockets that are waiting for incoming connections).

### What is IPv6? Why should we consider using it if we have IPv4?

**IPv6 (Internet Protocol version 6)**:
- IPv6 is the latest version of the Internet Protocol, designed as the successor to IPv4. It provides a significantly larger address space than IPv4, allowing for more unique IP addresses.
- **Advantages** of IPv6 over IPv4:
  - **Address Space**: IPv6 provides 128-bit addresses compared to IPv4's 32-bit addresses, accommodating more devices and addressing future growth.
  - **Efficiency**: IPv6 improves routing and reduces the size of routing tables, leading to improved network efficiency.
  - **Security**: IPv6 includes built-in support for IPSec, enhancing security features compared to IPv4.
  - **Auto-configuration**: IPv6 enables devices to auto-configure their own IP addresses, simplifying network setup and management.

### What is VLAN?

**VLAN (Virtual Local Area Network)**:
- VLAN is a logical grouping of network devices and computers, regardless of their physical location, into a single broadcast domain. VLANs are created to segment networks logically for security, traffic management, and flexibility reasons.

### What is MTU?

**MTU (Maximum Transmission Unit)**:
- MTU refers to the maximum size of data packets that a network protocol can transmit over a network. It specifies the largest size of a packet or frame that can be sent in a single transmission.

### What happens if you send a packet that is bigger than the MTU?

- When a packet larger than the MTU is sent over a network, it results in a condition called **packet fragmentation**:
  - The sending device divides the oversized packet into smaller fragments that fit within the MTU size of the network.
  - Each fragment includes a fragment offset field to indicate its position in the original packet sequence.
  - The receiving device reassembles the fragments into the original packet before delivering it to the application.

### True or False? Ping is using UDP because it doesn't care about reliable connection.

- **False**. Ping uses the ICMP (Internet Control Message Protocol), not UDP (User Datagram Protocol), to send echo request packets and receive echo reply packets. ICMP is a network layer protocol used for diagnostic purposes and does not rely on TCP or UDP for communication.

### What is SDN?

**SDN (Software-Defined Networking)**:
- SDN is an approach to networking that separates the control plane (which determines how data packets are forwarded) from the data plane (which forwards data packets). It enables centralized management and programmability of network infrastructure through software.

### What is ICMP? What is it used for?

**ICMP (Internet Control Message Protocol)**:
- ICMP is a network layer protocol used to exchange error and control messages between network devices. It is primarily used for:
  - **Ping**: Verifying connectivity between devices by sending echo request/reply messages.
  - **Traceroute**: Determining the path taken by packets from source to destination.
  - **Error Reporting**: Notifying senders of packet delivery failures, unreachable hosts, and other network-related issues.

### What is NAT? How does it work?

**NAT (Network Address Translation)**:
- NAT is a technique used to modify IP address information in IP packet headers while packets are traversing a routing device (like a router or firewall). It translates private IP addresses used within a local network into public IP addresses used on the Internet.

**How NAT Works**:
- **Address Translation**: NAT maps multiple private IP addresses to a single public IP address (or a pool of public IP addresses) to conserve public IP address space.
- **Port Translation**: NAT assigns unique port numbers to each connection from the internal network, allowing multiple devices to share a single public IP address.
- NAT operates at the network layer (Layer 3) of the OSI model and helps facilitate communication between private networks and the Internet by hiding internal IP addresses from external networks.

Understanding these networking concepts is crucial for designing, managing, and troubleshooting modern computer networks effectively.

Here are the port numbers commonly used by various protocols:

- **SSH (Secure Shell)**: Port 22
- **SMTP (Simple Mail Transfer Protocol)**: Port 25 (non-encrypted), Port 465 (SSL/TLS), Port 587 (SMTP with STARTTLS)
- **HTTP (Hypertext Transfer Protocol)**: Port 80
- **DNS (Domain Name System)**: Port 53
- **HTTPS (Hypertext Transfer Protocol Secure)**: Port 443
- **FTP (File Transfer Protocol)**: Port 21 (control), Port 20 (data)
- **SFTP (SSH File Transfer Protocol)**: Typically runs over SSH on Port 22 or other custom ports

### Factors Affecting Network Performance:

Several factors can affect network performance:

1. **Bandwidth**: The amount of data that can be transmitted in a fixed amount of time.
2. **Latency**: The time it takes for data to travel from its source to its destination.
3. **Jitter**: Variation in latency over time, affecting the consistency of packet delivery.
4. **Packet Loss**: Loss of data packets during transmission, which can degrade performance.
5. **Network Congestion**: When network traffic exceeds its capacity, causing delays and packet loss.
6. **Hardware Performance**: The capabilities of routers, switches, and other networking equipment.
7. **Software Configuration**: How network protocols and configurations are set up and managed.
8. **Quality of Service (QoS)**: Mechanisms to prioritize certain types of network traffic over others.
9. **Environmental Factors**: Interference, electromagnetic interference (EMI), and physical obstructions.

### APIPA (Automatic Private IP Addressing):

**APIPA** is a feature in Microsoft Windows operating systems that automatically assigns a private IP address to a computer when a DHCP server is unavailable. It ensures that the computer can still communicate on the local network without manual configuration.

### IP Range Used by APIPA:

APIPA uses the following IP address range:

- **IPv4**: 169.254.0.1 to 169.254.255.254

Computers configured with APIPA select an IP address from this range if they fail to obtain a valid IP address from a DHCP server. This allows for local network communication until a DHCP server becomes available or manual IP configuration is performed.

Let's dive into each of these networking concepts:

### Control Plane

- **Control Plane**: The control plane is responsible for making decisions about how data should flow through the network. It manages the routing tables, determines the best paths for data packets, and exchanges routing information between network devices. Essentially, it controls the network's behavior and topology.

### Data Plane

- **Data Plane**: The data plane, also known as the forwarding plane or forwarding engine, is responsible for actually forwarding data packets based on the information provided by the control plane. It performs the actual packet forwarding, switching, and routing based on the established rules and decisions made by the control plane.

### Management Plane

- **Management Plane**: The management plane is responsible for monitoring and configuring network devices and services. It provides the interface for administrators to manage the network, configure devices, monitor performance, and troubleshoot issues.

### Routing Tables

- **Routing Tables**: Creating routing tables belongs to the **control plane**. Routing tables are used by routers to determine the best paths for forwarding data packets towards their destinations. The control plane constructs and updates these tables based on routing protocols, network topology, and administrative configurations.

### Spanning Tree Protocol (STP)

- **Spanning Tree Protocol (STP)**: STP is a network protocol used to prevent loops in Ethernet networks where multiple paths between switches could cause broadcast storms and network instability. STP selects a single path that spans all switches in the network, blocking redundant paths to ensure a loop-free topology.

### Link Aggregation

- **Link Aggregation**: Link aggregation, also known as port trunking or bonding, is the process of combining multiple network connections (Ethernet links) into a single logical interface. It improves bandwidth, redundancy, and load balancing across multiple links. Link aggregation requires support from both the network devices (switches) and the connected hosts.

### Asymmetric Routing

- **Asymmetric Routing**: Asymmetric routing occurs when incoming and outgoing packets of a communication session follow different paths in a network. It can happen due to network asymmetries, load balancing configurations, or routing policy changes. Dealing with asymmetric routing typically involves ensuring that both paths are properly configured to handle the traffic symmetrically without issues like packet drops or out-of-order delivery.

### Overlay (Tunnel) Protocols

Overlay protocols encapsulate one network protocol within another for communication across network boundaries. Two common overlay protocols are:

- **GRE (Generic Routing Encapsulation)**: GRE is an IP tunneling protocol that encapsulates packets inside IP packets, allowing data to be transmitted across networks that do not support the original packet's protocol.
  
- **VXLAN (Virtual Extensible LAN)**: VXLAN is an overlay network protocol used to create virtualized Layer 2 networks over Layer 3 networks. It encapsulates Ethernet frames in UDP packets, enabling large-scale virtual networks in cloud computing environments.

These concepts are fundamental in networking, especially in designing and managing complex network infrastructures to ensure efficient data flow, redundancy, and manageability.

Let's explore each of these networking concepts:

### SNAT (Source Network Address Translation)

- **SNAT**: SNAT is a technique used in networking to modify the source IP address of outgoing packets. It allows multiple devices within a private network to share a single public IP address when communicating with external networks. SNAT helps conserve public IP addresses and facilitates outbound communication from private networks.

### OSPF (Open Shortest Path First)

- **OSPF**: OSPF is a routing protocol used within autonomous systems (AS) to determine the best paths for routing IP packets. It operates based on the shortest path first (SPF) algorithm, calculating routes based on metrics such as link bandwidth and cost. OSPF dynamically adjusts to network changes and converges quickly, making it suitable for large and complex networks.

### Latency

- **Latency**: Latency refers to the delay between the initiation of a network request and the beginning of a response. It is typically measured in milliseconds (ms) and includes factors like propagation delay (the time it takes for data to travel from source to destination) and processing delay (time spent in routers, switches, or devices).

### Bandwidth

- **Bandwidth**: Bandwidth refers to the maximum data transfer rate of a network or internet connection. It is usually measured in bits per second (bps) or its multiples (Mbps, Gbps). Bandwidth determines how much data can be transmitted over the network in a given amount of time.

### Throughput

- **Throughput**: Throughput refers to the actual amount of data successfully transmitted over a network in a given period. It is the measure of how much useful data is delivered per unit of time and is influenced by factors such as latency, bandwidth, and network congestion.

### Importance of Latency vs Throughput

- **Search Query**: When performing search queries, latency is often more critical than throughput. Low latency ensures that search results are returned quickly, providing a better user experience. To manage global infrastructure, optimizing network routes, using content delivery networks (CDNs), and locating data centers closer to users can help reduce latency.

- **Uploading Video**: When uploading videos, throughput (bandwidth) is generally more important than latency. Higher throughput ensures that large video files are uploaded quickly and efficiently. To assure this, using high-speed internet connections, optimizing network configurations, and leveraging video content delivery networks (CDNs) can enhance upload speeds.

### Other Considerations when Forwarding Requests

Besides latency and throughput, other considerations include:

- **Reliability**: Ensuring that forwarded requests reach their destination without errors or packet loss.
  
- **Security**: Implementing protocols like HTTPS, firewalls, and access controls to protect data during transmission.
  
- **Scalability**: Designing network architectures that can handle increasing traffic volumes and user demands over time.
  
- **Quality of Service (QoS)**: Prioritizing certain types of network traffic (e.g., voice or video) to ensure consistent performance levels.

### Spine & Leaf Architecture

- **Spine & Leaf**: Spine & Leaf is a network architecture design used in data centers to provide high bandwidth, low latency, and scalability. It consists of two layers:
  
  - **Spine Layer**: Core switches (spines) that connect to every switch in the leaf layer.
  - **Leaf Layer**: Access switches (leaves) that connect servers and end devices.

  In Spine & Leaf architecture, every leaf switch is connected to every spine switch, creating a non-blocking, high-performance fabric. This design supports efficient east-west traffic (between servers) and is highly scalable by adding more leaf or spine switches as needed.

Understanding these concepts is crucial for designing, managing, and troubleshooting modern computer networks, whether for data centers, cloud environments, or global networking infrastructures.

Let's delve into each of these networking concepts:

### Network Congestion

- **Definition**: Network congestion occurs when the demand for network resources exceeds the available capacity, leading to degraded performance, packet loss, and delays in data transmission.
  
- **Causes**:
  1. **High Network Traffic**: When many devices or users simultaneously use a network segment.
  2. **Network Bottlenecks**: Congestion can occur at routers, switches, or links with limited bandwidth.
  3. **Faulty Network Equipment**: Malfunctioning hardware can disrupt traffic flow.
  4. **Misconfigured Network Devices**: Improper settings or routing can cause inefficiencies.
  5. **Denial of Service (DoS) Attacks**: Malicious attempts to overwhelm a network with traffic.

### UDP Packet Format vs TCP Packet Format

- **UDP Packet Format**:
  - UDP (User Datagram Protocol) is a connectionless protocol that sends packets without establishing a connection.
  - **Header**: UDP Header consists of Source Port, Destination Port, Length, and Checksum fields.
  - **Use Case**: Suitable for applications where speed and efficiency are prioritized over reliability, such as real-time streaming or VoIP.

- **TCP Packet Format**:
  - TCP (Transmission Control Protocol) is a connection-oriented protocol that establishes a reliable, bidirectional communication channel before data exchange.
  - **Header**: TCP Header includes Source Port, Destination Port, Sequence Number, Acknowledgment Number, Window Size, and Checksum fields.
  - **Use Case**: Ideal for applications requiring guaranteed data delivery, such as web browsing, email, and file transfer.

- **Difference**: TCP ensures reliable data delivery through features like sequence numbers, acknowledgments, and retransmissions, whereas UDP focuses on minimal overhead and fast transmission without error-checking or recovery mechanisms.

### Exponential Backoff Algorithm

- **Definition**: Exponential Backoff is a network congestion control technique used in protocols like Ethernet and TCP/IP.
  
- **Usage**: It's employed when network collisions or packet loss occur. After a collision, the transmitting device waits for a random amount of time and retries. If another collision occurs, the waiting time is doubled exponentially.
  
- **Objective**: Prevents repeated collisions and reduces network congestion by adjusting retransmission attempts dynamically.

### Hamming Code Example

- **Data Word**: 100111010001101

  To calculate the Hamming code:
  
  1. Identify parity bits positions: 1, 2, 4, 8, 16.
  2. Insert data bits in the remaining positions (3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15).
  3. Calculate parity bits based on data bits in each parity position.
  4. Formulate the Hamming code word with parity and data bits.

  Example Hamming code (assuming even parity):
  
  Data Bits: 100111010001101
  
  Parity Bits: 01101011110 (calculated based on data bits)
  
  Hamming Code Word: 01101011110100111010001101

### Protocols Found in Application Layer

- **Examples**: HTTP, HTTPS, FTP, SMTP, POP3, IMAP, DNS, DHCP, SNMP, SSH, Telnet, SIP.

### Protocols Found in Network Layer

- **Examples**: IPv4, IPv6, ICMP, ARP, OSPF, BGP, IGMP.

### HSTS (HTTP Strict Transport Security)

- **Definition**: HSTS is a web security policy mechanism that helps to protect websites against downgrade attacks and cookie hijacking. It forces web browsers to communicate with a website only over HTTPS, enhancing security by ensuring all communication is encrypted and authenticated.

### Network - Misc

- **Internet vs World Wide Web**:
  - **Internet**: A global network of interconnected networks that use the TCP/IP protocol suite to transmit data worldwide.
  - **World Wide Web (WWW)**: An information space where documents and resources are identified by URLs and accessed via the HTTP or HTTPS protocols.

- **ISP (Internet Service Provider)**:
  - An ISP is a company that provides individuals and organizations with access to the Internet. ISPs offer various services, including internet connectivity, email services, web hosting, and domain registration.

Understanding these networking concepts is crucial for comprehending how data is transmitted, secured, and managed across modern computer networks and the Internet.

