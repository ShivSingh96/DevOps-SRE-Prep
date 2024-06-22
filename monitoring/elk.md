### Elastic Stack

#### What is the Elastic Stack?
The Elastic Stack, also known as ELK Stack, is a collection of open-source tools developed by Elastic for searching, analyzing, and visualizing data in real-time. It consists of Elasticsearch, Logstash, Kibana, and Beats.

#### Elasticsearch
Elasticsearch is a distributed, RESTful search and analytics engine built on top of Apache Lucene. It allows you to store, search, and analyze large volumes of data quickly and in near real-time. Elasticsearch is schema-free, which means it can index and search diverse types of data.

#### Logstash
Logstash is an open-source data collection pipeline tool that ingests data from various sources, transforms it, and sends it to Elasticsearch or other storage systems. It helps in processing and enriching data before it is indexed.

#### Beats
Beats are lightweight data shippers that send data from hundreds or thousands of machines to either Logstash or Elasticsearch directly. Beats collect different types of data (like logs, metrics, or network data) and deliver it to the Elastic Stack for indexing and analysis.

#### Kibana
Kibana is an open-source data visualization dashboard for Elasticsearch. It provides visualization capabilities on top of data indexed in Elasticsearch. Kibana allows users to create and share dynamic dashboards that display changes to Elasticsearch queries in real-time.

### Workflow in the Elastic Stack

#### Workflow from App Logging to Dashboard Display

1. **Logging by Application**:
   - An application logs events or data into log files or streams.

2. **Data Collection (Beats)**:
   - Beats agents installed on application servers collect logs and metrics data.
   - Beats forward this data to Logstash or directly to Elasticsearch.

3. **Data Transformation and Enrichment (Logstash)**:
   - Logstash processes incoming data, parses it, transforms it as needed (e.g., filtering, enhancing with metadata), and prepares it for indexing.

4. **Indexing (Elasticsearch)**:
   - Elasticsearch receives the transformed data from Logstash or Beats.
   - Data is indexed in real-time, allowing for fast search and retrieval.

5. **Visualization (Kibana)**:
   - Users interact with Kibana to create visualizations and dashboards.
   - Kibana queries Elasticsearch to retrieve data and display it in charts, graphs, and tables.
   - Users can customize dashboards, create alerts, and perform ad-hoc data analysis.

6. **Real-Time Updates**:
   - As new data is logged and indexed, Kibana updates visualizations in real-time, providing live monitoring and analysis capabilities.

### Elasticsearch

#### Data Node
- **Data Node**: A node in Elasticsearch responsible for storing data and executing data-related operations like CRUD (Create, Read, Update, Delete) operations, search, and aggregation queries.

#### Master Node
- **Master Node**: A node in Elasticsearch responsible for cluster-wide management tasks such as index creation, mapping updates, and shard allocation.

#### Ingest Node
- **Ingest Node**: A node in Elasticsearch responsible for pre-processing documents before indexing. It allows you to apply transformations and enrichments to incoming data.

#### Coordinating Only Node
- **Coordinating Only Node**: A node in Elasticsearch that does not hold any data or participate in data-related operations. It acts as a coordinator for query requests and distributes operations across data nodes.

#### Data Storage in Elasticsearch
- Data in Elasticsearch is stored in **indices**, which are logical partitions that hold a collection of documents.
- Each document is a JSON object that contains the actual data and its associated metadata.

#### Index
- **Index**: In Elasticsearch, an index is a collection of documents that share similar characteristics or data types. It is analogous to a database table in relational databases.

#### Shards
- **Shards**: Elasticsearch divides an index into multiple shards to distribute and scale data across nodes. Shards are the basic units of scalability and performance in Elasticsearch.

#### Inverted Index
- **Inverted Index**: In Elasticsearch, an inverted index is a data structure used to optimize full-text search. It maps each unique term in the index to the list of documents that contain that term. This allows for fast lookup and retrieval of documents based on search queries.

If you have more questions or need further explanations on any of these topics, feel free to ask!

### Elasticsearch Concepts Explained

#### What is a Document?
In Elasticsearch, a **document** is the basic unit of information that can be indexed. It is represented as a JSON object that contains data. Each document is stored in an index and has a unique identifier. Documents are similar to rows in a relational database table.

#### Cluster Health
- **Cluster Health**: When you check the health of an Elasticsearch cluster, it can be in one of three states:
  - **Green**: All primary and replica shards are active.
  - **Yellow**: All primary shards are active, but not all replica shards are active. This typically means some data is missing because replica shards are not yet allocated.
  - **Red**: At least one primary shard and its replicas are not active. This usually indicates data loss for the affected indices or shards.

#### True or False? Elasticsearch Indexes All Data in Every Field
False. Elasticsearch does not index all data in every field by default. You have to explicitly define which fields to index and how they should be indexed using mappings.

#### Reserved Fields in a Document
Elasticsearch automatically adds several reserved fields to each document, including:
- **_index**: The index name where the document is stored.
- **_type**: The type of the document (deprecated in recent versions).
- **_id**: The unique identifier of the document.
- **_source**: The original JSON body of the document.
- **_timestamp**: The timestamp of when the document was indexed.
- **_version**: The version of the document.
- **_score**: The relevance score of the document in a query result.

#### Mapping
- **Mapping**: In Elasticsearch, a mapping defines how documents and their fields are stored and indexed. It specifies the data type, format, and behavior of each field. By defining your own mapping, you can control how data is indexed, analyzed, and queried. This is particularly useful for customizing text analysis, defining explicit data types, and optimizing search performance.

#### Replicas
- **Replicas**: In Elasticsearch, replicas are copies of primary shards that serve as failover copies. Replicas enhance data availability and resilience by providing backup copies of data that can be promoted to primary shards if necessary. Replicas are also used to distribute search and query load across nodes in a cluster.

#### Term Frequency & Document Frequency
- **Term Frequency (TF)**: Term frequency refers to the number of times a term (word) appears in a document. It helps in scoring relevance when querying Elasticsearch.
- **Document Frequency (DF)**: Document frequency refers to the number of documents that contain a specific term. It helps in scoring the rarity or commonness of a term across all documents in an index.

#### Current Phase under Index Lifecycle Management (ILM)
- **Current Phase "hot"**: In Index Lifecycle Management (ILM) of Elasticsearch, the "hot" phase refers to the initial phase where newly indexed data is actively queried and updated. During this phase, data is typically stored on fast storage and is readily available for search operations.

#### Example Command: curl -X PUT "localhost:9200/customer/_doc/1?pretty" -H 'Content-Type: application/json' -d'{ "name": "John Doe" }'
- This command creates a new document with the ID "1" in the "customer" index.
- The document contains a field "name" with the value "John Doe".
- If the document with ID "1" already exists, running this command again will update the existing document with the new content.
- Running this command multiple times will either create or update the document based on the provided ID.

#### Bulk API
- **Bulk API**: The Bulk API in Elasticsearch allows you to perform multiple indexing, deleting, or updating operations in a single request. It is more efficient than sending individual requests for each operation, especially when dealing with large volumes of data.
- Use Cases: You would use the Bulk API to initially index a large dataset, perform batch updates, or delete multiple documents in one operation.

If you have more questions or need further clarification on any Elasticsearch topic, feel free to ask!

### Query DSL

#### Elasticsearch Query Syntax
Elasticsearch Query DSL (Domain Specific Language) allows you to specify queries and filters to retrieve and manipulate data. Here are some key components:
- **Booleans**: Used to combine multiple queries with `must`, `must_not`, `should`, and `filter`.
- **Fields**: Specify which fields to search in a query, such as `match`, `term`, or `range`.
- **Ranges**: Used to filter documents within a specified range of values using `range` queries.

#### Relevance Score
- **Relevance Score**: In Elasticsearch, each document returned by a query is assigned a relevance score based on how well it matches the query criteria. This score determines the order in which documents are returned in search results, with higher scores indicating greater relevance.

#### Query Context and Filter Context
- **Query Context**: Used to calculate the relevance score of documents. Results are sorted by relevance score.
- **Filter Context**: Used to narrow down the results but does not affect the relevance score. Filters are used for boolean conditions that must match but do not affect scoring.

#### Architecture Differences: Small-scale vs. Large-scale Production Environment
- **Small-scale Environment**: Typically runs Elasticsearch, Logstash, and Kibana on a single or few nodes. Data volumes are moderate, and there might be minimal redundancy or replication.
- **Large-scale Environment**: Involves clustering Elasticsearch across multiple nodes for high availability and scalability. Uses dedicated master, data, and coordinating nodes. Utilizes advanced features like index sharding, replication, and data partitioning. Includes additional components for monitoring, backup, and security.

### Logstash

#### Logstash Plugins
- **Logstash Plugins**: Extend Logstash functionality for input, output, codecs, and filters. Types include:
  - **Input Plugins**: Retrieve data from various sources.
  - **Output Plugins**: Send data to different destinations.
  - **Codec Plugins**: Encode and decode data formats.
  - **Filter Plugins**: Modify, parse, and enrich data during processing.

#### Grok
- **Grok**: A pattern-matching tool used in Logstash to parse unstructured log data into structured fields.
- **How Grok Works**: Grok uses predefined patterns to match and extract parts of log messages. Patterns are defined in a configuration file and applied to log lines to extract relevant data.

#### `_grokparsefailure`
- `_grokparsefailure`: Indicates that a log line did not match any defined grok patterns during parsing in Logstash. It helps identify logs that couldn't be parsed correctly.

#### Testing or Debugging Grok Patterns
- **Debugging Grok**: Tools like `grokdebug.herokuapp.com` allow you to test and debug grok patterns interactively by providing sample log data and verifying pattern matches.

#### Logstash Codecs
- **Logstash Codecs**: Define how data is encoded or decoded between input and output plugins in Logstash. Types include:
  - **Plain**: No encoding, suitable for text data.
  - **JSON**: Encode or decode JSON data.
  - **Line**: Process line-based text data.
  - **Multiline**: Handle multi-line log entries.

### Kibana

#### Discover in Kibana
- **Discover**: Allows searching and exploring indexed data stored in Elasticsearch. You can filter, aggregate, and view raw documents matching query criteria.

#### "561 Hits" in Kibana Discover
- **561 Hits**: Indicates the number of documents matching the current search query in Kibana's Discover tab.

#### Visualize in Kibana
- **Visualize**: Enables creating charts, graphs, and other visual representations of data stored in Elasticsearch. It supports various visualization types to analyze and present data.

#### Visualization Types in Kibana
- **Supported Types**: Include bar charts, line charts, pie charts, area charts, histograms, heatmaps, and more.
- **Statistical Outliers**: For detecting outliers, you might use visualizations like box plots or histograms with anomaly detection features.

#### Creating a Dashboard in Kibana
- **Steps**:
  1. **Create Visualizations**: Build individual visualizations based on data queries.
  2. **Add Visualizations to Dashboard**: Arrange and configure visualizations on a Kibana dashboard.
  3. **Configure Filters and Time Ranges**: Apply filters and set time ranges for data displayed on the dashboard.
  4. **Save and Share**: Save the dashboard for future use and share it with other users.

### Filebeat

#### Filebeat
- **Filebeat**: Lightweight shipper for forwarding log data to Elasticsearch or Logstash. It monitors log files, collects log events, and sends them to the specified output.

#### Usage with ELK Stack
- **Filebeat**: While not mandatory, Filebeat is highly useful in ELK (Elasticsearch, Logstash, Kibana) environments for shipping logs from various sources to Elasticsearch or Logstash for indexing and analysis.

#### Harvester
- **Harvester**: In Filebeat, a harvester reads and processes log files line by line based on specified configuration parameters. Each harvester processes a single log file.

#### Multiple Harvesters
- **True**: A single Filebeat instance can manage multiple harvesters, each responsible for monitoring and collecting logs from different files based on configuration settings.

#### Filebeat Modules
- **Modules**: Pre-configured Filebeat modules simplify log collection for popular services and platforms. They include predefined inputs, parsers, and dashboards tailored for specific log types.

### Elastic Stack Security

#### Securing Elastic Stack
- **Security Features**: Secure Elasticsearch, Logstash, and Kibana by:
  - **Authentication**: Enforce user authentication with roles and permissions.
  - **Transport Layer Security (TLS)**: Encrypt communications between nodes and clients.
  - **Authorization**: Control access to indices and features based on user roles.
  - **Audit Logging**: Monitor and log access to sensitive data and actions.
  - **Encryption**: Encrypt data at rest to protect stored information.

If you have more questions or need further details on any specific topic, feel free to ask!

