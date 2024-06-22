### Prometheus

**What is Prometheus?**
Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. It is designed for reliability and scalability, and it provides a flexible query language (PromQL) to allow powerful queries and alerting capabilities. Prometheus primarily focuses on time-series-based monitoring of systems and applications.

**Main Features of Prometheus:**
1. **Multi-dimensional Data Model:** Metrics are stored as key-value pairs with labels, enabling flexible querying and analysis.
2. **PromQL:** Powerful query language for slicing and dicing collected metrics data.
3. **Pull-Based Metrics Collection:** Prometheus scrapes metrics from HTTP endpoints exposed by target services.
4. **Service Discovery:** Automatically discovers and monitors new services as they come online.
5. **Alerting:** Supports alerting rules based on PromQL queries to notify operators about issues.
6. **Time Series Database:** Efficiently stores and queries time-series data for monitoring.

**Scenarios Where It Might Not Be Ideal to Use Prometheus:**
1. **High Cardinality Data:** Prometheus performs best with low cardinality data (limited number of time series). High cardinality can lead to increased memory and storage requirements.
2. **Long-Term Data Retention:** While Prometheus can store data for a configurable period, it's not optimized for long-term storage or historical analysis compared to dedicated solutions like InfluxDB or TimescaleDB.
3. **Complex Aggregations:** Complex multi-dimensional aggregations or queries might require additional tools or extensions beyond Prometheus's core capabilities.

**Prometheus Architecture:**
- **Prometheus Server:** Core component that pulls metrics data from configured targets (services or applications) at regular intervals.
- **Time Series Database:** Stores scraped time-series data.
- **Alertmanager:** Handles alerts sent by Prometheus Server and manages the alert lifecycle (e.g., deduplication, notification).
- **Exporters:** Auxiliary processes that expose metrics from systems or services not natively supported by Prometheus.
- **Pushgateway:** Optional component to allow ephemeral and batch jobs to push metrics to Prometheus.

**Comparison to InfluxDB:**
- **Data Model:** Prometheus uses a multi-dimensional data model with key-value pairs (labels), while InfluxDB uses a tag-based data model.
- **Query Language:** PromQL vs. InfluxQL. PromQL is specifically tailored for time-series data and Prometheus features.
- **Use Cases:** Prometheus is ideal for real-time monitoring and alerting, while InfluxDB is designed for handling large-scale time-series data with long-term storage and complex queries.

**Key Concepts in Prometheus:**
- **Alert:** A defined condition based on PromQL query results that triggers a notification.
- **Instance:** A single endpoint (host or container) being monitored.
- **Job:** A collection of instances that perform the same function, like a group of web servers.

**PromQL Core Metric Types:**
Prometheus supports various core metric types including counters, gauges, histograms, and summaries. These types capture different aspects of system performance and behavior.

**Exporter:**
An exporter is a bridge that allows Prometheus to monitor metrics from systems or services that don't natively expose Prometheus metrics. Exporters convert metrics into a format that Prometheus can scrape.

**Best Practices for Prometheus:**
- **Label Cardinality:** Keep label cardinality low to optimize performance and resource usage.
- **Scraping Configuration:** Fine-tune scraping intervals based on target service requirements.
- **Alerting Rules:** Define clear and actionable alerting rules to avoid alert fatigue.
- **Backup and Recovery:** Regularly back up Prometheus data and configuration to ensure data integrity and quick recovery.
- **Monitoring Prometheus Itself:** Monitor Prometheus server and components to ensure reliability.

**Prometheus Query Examples:**
- **Total Requests in a Given Period:**
  ```promql
  sum(rate(http_requests_total{job="webserver"}[1h]))
  ```

**High Availability (HA) in Prometheus:**
- HA in Prometheus typically refers to running multiple Prometheus servers behind a load balancer to ensure reliability and fault tolerance. Each Prometheus server independently scrapes targets and stores data, but they share alerting rules and configuration.

**Joining Two Metrics:**
- PromQL doesn't support joins in the traditional SQL sense. Instead, you can aggregate and correlate metrics using operations like `+`, `-`, `*`, `/`, etc., based on matching label sets.

**Query for Label Value:**
- To get the value of a specific label in a query:
  ```promql
  http_requests_total{job="webserver"} # To see all values
  ```

**CPU Usage in Percentage:**
- To convert `cpu_user_seconds` to CPU usage percentage:
  ```promql
  (rate(container_cpu_usage_seconds_total{container="your-container"}[5m]) / scalar(sum(machine_cpu_cores))) * 100
  ```

This query calculates CPU usage as a percentage over a 5-minute period for a specific container. Adjust the metric names and labels according to your setup.

