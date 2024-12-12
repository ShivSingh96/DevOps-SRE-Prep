### **What is REST API & How it Works?**

#### **Definition:**
REST (Representational State Transfer) API is an architectural style for designing networked applications. It uses standard HTTP methods (GET, POST, PUT, DELETE) for communication between a client and a server.

#### **Key Features:**
1. **Stateless:** Each request contains all the necessary information; no client context is stored on the server.
2. **Resource-Based:** Data and functionality are represented as resources (e.g., `/users`, `/orders`).
3. **Standard HTTP Methods:**
   - **GET:** Retrieve data.
   - **POST:** Create new data.
   - **PUT/PATCH:** Update existing data.
   - **DELETE:** Remove data.
4. **Use of URIs (Uniform Resource Identifiers):** Resources are accessed via specific URLs.
5. **Format Independence:** Works with multiple data formats like JSON, XML, or plain text (JSON is most common).

#### **How it Works:**
1. **Client Request:** A client (e.g., a web browser or mobile app) sends an HTTP request to a specific endpoint (e.g., `https://api.surveymonkey.com/v3/surveys`).
2. **Server Processing:** The server processes the request using the relevant business logic and interacts with databases or other services if necessary.
3. **Response:** The server sends back a response with a status code (e.g., 200 for success) and optional data payload.

#### **Importance of REST API:**
1. **Scalability:** RESTful services are stateless, allowing them to scale horizontally.
2. **Interoperability:** Easy integration between different platforms and systems.
3. **Simplicity:** Developers can easily understand and use REST APIs due to their standard HTTP methods.
4. **Flexibility:** REST APIs can evolve without affecting existing clients as long as backward compatibility is maintained.

---

### **Relational & Non-Relational Databases:**

#### **Relational Databases (RDBMS):**
- Use structured schema-based tables.
- Data is stored in rows and columns.
- Uses SQL (Structured Query Language) for querying.
- Examples: MySQL, PostgreSQL, Microsoft SQL Server.

**Key Characteristics:**
1. **Schema:** Predefined schema enforces data consistency.
2. **ACID Compliance:** Ensures atomicity, consistency, isolation, and durability for transactions.
3. **Relationships:** Supports foreign keys for complex relationships between tables.

**Use Cases:**
- Financial systems where consistency is critical.
- Applications with structured, predictable data (e.g., CRM systems).

---

#### **Non-Relational Databases (NoSQL):**
- Flexible, schema-less data storage.
- Types: Key-Value (Redis), Document (MongoDB), Columnar (Cassandra), Graph (Neo4j).
- NoSQL databases handle semi-structured or unstructured data.

**Key Characteristics:**
1. **Scalability:** Designed for horizontal scaling.
2. **Varied Models:** Allows data in JSON, key-value pairs, or graphs.
3. **Eventual Consistency:** Trades consistency for high availability.

**Use Cases:**
- Real-time analytics.
- Applications requiring high throughput and low latency (e.g., social media, IoT).

---

#### **How to Choose:**
- **Relational Database:** When data consistency, structured queries, and relationships are paramount.
- **Non-Relational Database:** When dealing with high velocity, varied formats, or real-time processing requirements.

---

### **How Messaging Queues like Kafka Work?**

#### **What is Kafka?**
Apache Kafka is a distributed messaging system designed for high-throughput, fault-tolerant, and real-time data streaming. It acts as an intermediary between producers (data sources) and consumers (data processors).

---

#### **Core Components:**
1. **Producers:** Publish messages to Kafka topics.
2. **Topics:** Logical channels where messages are stored (partitioned for scalability).
3. **Brokers:** Kafka servers that manage message storage and delivery.
4. **Consumers:** Applications or services that subscribe to topics to consume messages.
5. **Zookeeper (or KRaft):** Manages metadata, leader election, and health.

#### **How Kafka Works:**
1. A producer sends a message to a topic in Kafka.
2. Kafka partitions the topic for parallel processing.
3. Messages are retained for a configurable period, allowing consumers to process them at their own pace.
4. Consumers subscribe to topics and process messages sequentially.

#### **Benefits for SurveyMonkey:**
- **Asynchronous Processing:** Decouples producers (survey submissions) from consumers (data analytics services).
- **Data Pipeline:** Streams real-time survey responses to analytics or storage systems.
- **Reliability:** Ensures message durability and at-least-once delivery semantics.

---

#### **Kafka in BookMyShow:**
1. **Ticket Bookings:**
   - Producers: Payment services or user apps publish booking details to Kafka.
   - Consumers: Inventory systems subscribe to update seat availability.
2. **Notifications:**
   - Kafka routes events to notification services for sending booking confirmations.
3. **Analytics:**
   - Streams user activity to analytics systems for insights on user behavior.

---

#### **Interview Tip:**
Be prepared to explain:
- How Kafka handles failures (e.g., leader election for partitions).
- Trade-offs between at-least-once and exactly-once delivery guarantees.
- How you'd monitor Kafka using Prometheus, Grafana, or Confluent tools.

### **How Kafka Handles Failures (e.g., Leader Election for Partitions):**

1. **Partition Leaders:**
   - In Kafka, each partition has one leader broker responsible for handling all read and write requests for that partition. Other brokers act as replicas.

2. **Replication and Fault Tolerance:**
   - Kafka uses replication to ensure fault tolerance. Each partition has multiple replicas, with one acting as the leader and others as followers.

3. **Leader Election Process:**
   - If the leader broker of a partition fails, Kafka elects a new leader from the followers.
   - This election is managed by **Zookeeper** or Kafka's **KRaft (Kafka Raft Consensus Protocol)** in newer versions.
   - Kafka ensures that the new leader is an in-sync replica (ISR), which means it has the latest committed data.

4. **Client Rebalancing:**
   - Once a new leader is elected, Kafka clients (producers and consumers) are informed to redirect their requests to the new leader.

---

### **Trade-offs Between At-Least-Once and Exactly-Once Delivery Guarantees:**

1. **At-Least-Once Delivery:**
   - **Description:** Messages are guaranteed to be delivered at least once, but there might be duplicates.
   - **Advantages:**
     - Simpler to implement.
     - Suitable for use cases where occasional duplicates are acceptable (e.g., analytics).
   - **Disadvantages:**
     - Requires downstream consumers to handle duplicates.
     - Increased processing effort for idempotency.

2. **Exactly-Once Delivery:**
   - **Description:** Each message is delivered and processed exactly once, eliminating duplicates.
   - **Advantages:**
     - No need for downstream idempotency logic.
     - Ideal for financial transactions or critical systems where accuracy is paramount.
   - **Disadvantages:**
     - Increased complexity in implementation.
     - Overhead in managing state to achieve exactly-once semantics (e.g., Kafka Streams' state store, transactional producers/consumers).

3. **Trade-off Decision:**
   - Use **at-least-once** for high-throughput, low-latency applications where duplicates are tolerable.
   - Use **exactly-once** for critical data processing pipelines, ensuring correctness.

---

### **How to Monitor Kafka Using Prometheus, Grafana, or Confluent Tools:**

1. **Prometheus for Kafka Monitoring:**
   - **Export Metrics:**
     - Use tools like **Kafka Exporter** to expose metrics to Prometheus.
   - **Important Metrics:**
     - **Broker Health:** Active broker count, under-replicated partitions.
     - **Throughput:** Incoming and outgoing messages per second.
     - **Lag:** Consumer group lag, indicating delays in message processing.
     - **Partition Metrics:** Leader election rate, ISR count.

2. **Grafana for Visualization:**
   - **Dashboards:**
     - Create dashboards using Prometheus as a data source.
     - Visualize broker health, consumer lag, and message rates.
   - **Alerts:**
     - Configure Grafana alerts for critical thresholds (e.g., high lag, broker unavailability).

3. **Confluent Control Center:**
   - **Overview:**
     - Confluent's enterprise tool provides a UI for Kafka cluster management and monitoring.
   - **Key Features:**
     - End-to-end monitoring of Kafka clusters.
     - Visibility into schema registry, producer/consumer activity.
     - Built-in alerts and anomaly detection.

4. **Custom Dashboards:**
   - Use **JMX Exporter** for custom Kafka metrics.
   - Monitor producer/consumer performance, partition distribution, and disk usage.

---

### **Tips for Interview Discussion:**
1. **Failure Handling:**
   - Be ready to explain how Kafka ensures data durability with replication and how ISR ensures only safe replicas are chosen during leader elections.

2. **Delivery Guarantees:**
   - Use practical examples (e.g., payment systems needing exactly-once or analytics pipelines preferring at-least-once).

3. **Monitoring:**
   - Highlight specific actions you’d take, like configuring alerts for consumer lag or tracking broker resource utilization.
