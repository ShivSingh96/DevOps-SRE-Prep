### DNS Basics

**DNS**: DNS stands for **Domain Name System**. It is a hierarchical and decentralized naming system used to translate human-readable domain names (like www.example.com) into IP addresses (like 192.0.2.1) that computers use to identify each other on the network.

**Uses**:
- **Name Resolution**: Translating domain names to IP addresses.
- **Email Routing**: Using MX (Mail Exchange) records to route emails.
- **Service Discovery**: Locating services using SRV (Service) records.

### DNS Resolution

**DNS Resolution**: The process of converting a domain name into its corresponding IP address. This process involves querying various DNS servers to retrieve the necessary information.

### Name Server

**Name Server**: A server that stores and provides DNS records. It answers queries from clients seeking information about domain names.

### Resolution Sequence for www.site.com

1. **Local DNS Cache**: The resolver on the client machine checks its own cache to see if it has recently resolved the name.
2. **Recursive Resolver**: If the local cache does not have the answer, the query is sent to a recursive resolver (usually provided by the ISP or a public DNS service like Google DNS or Cloudflare DNS).
3. **Root Name Server**: The recursive resolver queries one of the root name servers for the TLD (Top-Level Domain) information.
4. **TLD Name Server**: The root server directs the resolver to the appropriate TLD server (.com in this case).
5. **Authoritative Name Server**: The TLD server directs the resolver to the authoritative name server for the domain (site.com).
6. **Final Resolution**: The authoritative name server responds with the IP address of www.site.com.

### Domain Name Registrar

**Domain Name Registrar**: An organization or commercial entity that manages the reservation of internet domain names. Registrars are accredited by generic and country code top-level domain (TLD) registries.

### FQDN Breakdown: www.blipblop.com

- **Root**: The implicit root is represented by a dot (".") at the end of the FQDN, but it is often omitted. In this case, it is the highest level of the DNS hierarchy.
- **Top Level Domain (TLD)**: **com**
- **Second Level Domain (SLD)**: **blipblop**
- **Domain**: **blipblop.com**

### DNS Resolution Workflow

1. **Client Query**: The client machine initiates a query to resolve a domain name.
2. **Local Cache Check**: The client checks its local DNS cache.
3. **Recursive Resolver Query**: If not found, the client sends the query to a recursive resolver.
4. **Root Server Query**: The recursive resolver queries a root name server.
5. **TLD Server Query**: The root server responds with the address of a TLD server.
6. **Authoritative Server Query**: The recursive resolver queries the TLD server, which responds with the authoritative server for the domain.
7. **Final Resolution**: The authoritative server provides the IP address for the requested domain.
8. **Response to Client**: The recursive resolver returns the IP address to the client.
9. **Caching**: The client and resolver cache the response for future queries.

By understanding this process, one can diagnose and troubleshoot DNS issues effectively.

### DNS Records

**DNS Record**: A DNS record is a database record used to map a URL to an IP address. These records are stored in DNS servers and provide essential information about a domain, including its IP address, mail server, and other details.

### Types of DNS Records

1. **A (Address) Record**
   - **Purpose**: Maps a domain name to an IPv4 address.
   - **Example**: `www.example.com -> 192.0.2.1`

2. **AAAA (IPv6 Address) Record**
   - **Purpose**: Maps a domain name to an IPv6 address.
   - **Example**: `www.example.com -> 2001:0db8:85a3:0000:0000:8a2e:0370:7334`

3. **CNAME (Canonical Name) Record**
   - **Purpose**: Alias of one name to another. Used to point multiple domain names to the same IP address.
   - **Example**: `alias.example.com -> www.example.com`

4. **PTR (Pointer) Record**
   - **Purpose**: Maps an IP address to a domain name (reverse DNS lookup).
   - **Example**: `192.0.2.1 -> www.example.com`

5. **MX (Mail Exchange) Record**
   - **Purpose**: Specifies the mail server responsible for receiving email on behalf of a domain.
   - **Example**: `example.com -> mail.example.com`

6. **NS (Name Server) Record**
   - **Purpose**: Specifies the authoritative DNS servers for a domain.
   - **Example**: `example.com -> ns1.example.com, ns2.example.com`

### Details of Each Record Type

**A Record**:
- Maps a domain name to an IPv4 address.
- Example:
  ```
  www.example.com.   3600   IN   A   192.0.2.1
  ```

**AAAA Record**:
- Maps a domain name to an IPv6 address.
- Example:
  ```
  www.example.com.   3600   IN   AAAA   2001:0db8:85a3:0000:0000:8a2e:0370:7334
  ```

**CNAME Record**:
- Points one domain name to another domain name.
- Example:
  ```
  alias.example.com.   3600   IN   CNAME   www.example.com.
  ```

**PTR Record**:
- Provides the reverse lookup of an IP address to a domain name.
- Example:
  ```
  1.2.0.192.in-addr.arpa.   3600   IN   PTR   www.example.com.
  ```

**MX Record**:
- Directs email to the correct mail server.
- Example:
  ```
  example.com.   3600   IN   MX   10   mail.example.com.
  ```

**NS Record**:
- Indicates which DNS servers are authoritative for a domain.
- Example:
  ```
  example.com.   3600   IN   NS   ns1.example.com.
  example.com.   3600   IN   NS   ns2.example.com.
  ```

These records are essential for the proper functioning of DNS, ensuring that domain names can be resolved to IP addresses, emails are directed to the correct mail servers, and various other domain-related tasks are handled correctly.

### DNS - TTL

**DNS Records TTL (Time to Live)**:
- **Definition**: TTL is a value in a DNS record that tells how long that record is valid before it should be refreshed from the authoritative DNS server.
- **Purpose**: It determines how long a DNS resolver should cache the DNS query before requesting a fresh copy.
- **Example**: If a DNS record has a TTL of 3600 seconds (1 hour), any resolver caching that record will use the cached information for 1 hour before querying the DNS server again for updated information.

### DNS - Misc

**Is DNS using TCP or UDP?**
- **Both**:
  - **UDP**: DNS typically uses UDP for query responses because it is faster and most queries fit within the 512-byte size limit of a UDP packet.
  - **TCP**: DNS uses TCP for zone transfers between servers and when the response data size exceeds 512 bytes (or 4096 bytes with EDNS0).

**True or False? DNS can be used for load balancing**
- **True**: DNS can be used for load balancing.

**Techniques DNS can use for load balancing**:
1. **Round Robin**:
   - Multiple A or AAAA records are returned in a different order each time, distributing the load among multiple servers.
2. **Weighted Round Robin**:
   - Assigns weights to different IP addresses and adjusts the frequency with which each IP is returned based on its weight.
3. **Geolocation-based Load Balancing**:
   - Returns IP addresses based on the geographic location of the request, directing traffic to the nearest server.

**DNS Zone**:
- **Definition**: A DNS zone is a portion of the DNS namespace that is managed by a specific organization or administrator. It contains DNS records for a specific domain and its subdomains.
- **Purpose**: It helps in delegating management of different parts of the domain space, enhancing organization and security.

**Types of DNS Zones**:
1. **Primary (Master) Zone**:
   - The authoritative source for information about the zone. Changes are made directly to the primary zone file.
2. **Secondary (Slave) Zone**:
   - A read-only copy of the primary zone. It receives updates through zone transfers from the primary zone.
3. **Stub Zone**:
   - Contains only the essential records (NS, SOA, and sometimes A records) necessary to identify the authoritative DNS servers for the zone.
4. **Forward Zone**:
   - Maps domain names to IP addresses (normal DNS lookups).
5. **Reverse Zone**:
   - Maps IP addresses to domain names (reverse DNS lookups).

   