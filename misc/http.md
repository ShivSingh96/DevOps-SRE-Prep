### HTTP

**HTTP (Hypertext Transfer Protocol)** is a protocol used for transferring hypertext requests and information on the World Wide Web.

### HTTP Request Lifecycle

1. **URL Entry**: A user enters a URL (Uniform Resource Locator) into a web browser's address bar.
   
2. **DNS Resolution**: The browser resolves the domain name to an IP address using DNS (Domain Name System).

3. **TCP Connection**: The browser establishes a TCP (Transmission Control Protocol) connection with the server at the resolved IP address on port 80 (for HTTP) or 443 (for HTTPS).

4. **HTTP Request**: The browser sends an HTTP request to the server. The request includes:
   - **Method**: Specifies the HTTP method (GET, POST, PUT, DELETE, etc.).
   - **Headers**: Contains metadata about the request (e.g., User-Agent, Accept, Content-Type).
   - **Body**: Optional data sent with the request (e.g., form data in POST requests).

5. **Server Processing**: The server receives the request, processes it, and generates an HTTP response.

6. **HTTP Response**: The server sends an HTTP response back to the client. The response includes:
   - **Status Code**: Indicates the outcome of the request (e.g., 200 OK, 404 Not Found).
   - **Headers**: Metadata about the response (e.g., Content-Type, Cache-Control).
   - **Body**: Optional content returned by the server (e.g., HTML, JSON, binary data).

7. **Browser Rendering**: The browser receives the response, interprets the content (HTML, CSS, JavaScript), and renders it for the user.

8. **Connection Closure**: The TCP connection between the client and server may be closed, depending on whether it's a persistent connection (HTTP/1.1) or a new connection for each request (HTTP/1.0).

### True or False? HTTP is stateful
False. HTTP itself is stateless, meaning each request-response cycle is independent and does not retain information from previous interactions unless maintained through additional mechanisms like cookies or sessions.

### HTTP Request Example

An HTTP request typically looks like this:

```
GET /index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Connection: keep-alive
```

### HTTP Method Types

- **GET**: Requests data from a specified resource.
- **POST**: Submits data to be processed to a specified resource.
- **PUT**: Updates a resource or creates a new one.
- **DELETE**: Deletes a specified resource.
- **PATCH**: Applies partial modifications to a resource.
- **HEAD**: Similar to GET, but only retrieves headers (useful for checking resource existence).
- **OPTIONS**: Describes the communication options for the target resource.
- **TRACE**: Echoes the received request to the client for diagnostic purposes.

### HTTP Response Codes

HTTP response codes indicate the status of the request:

- **1xx**: Informational responses (e.g., 100 Continue).
- **2xx**: Success (e.g., 200 OK, 201 Created).
- **3xx**: Redirection (e.g., 301 Moved Permanently, 302 Found).
- **4xx**: Client errors (e.g., 400 Bad Request, 404 Not Found).
- **5xx**: Server errors (e.g., 500 Internal Server Error, 503 Service Unavailable).

### HTTPS (Hypertext Transfer Protocol Secure)

HTTPS is an extension of HTTP that adds encryption using SSL/TLS protocols to secure data transmission over the internet. It ensures that the data sent between the client and server is encrypted and thus more secure against eavesdropping and tampering.

### HTTP Cookies

HTTP cookies are small pieces of data stored on the client-side (in the browser) by websites. They are used to maintain stateful information across HTTP requests and responses. Cookies can store user preferences, session information, authentication tokens, and other data that enhances the browsing experience or tracks user behavior.

### HTTP Pipelining

HTTP pipelining is a technique where multiple HTTP requests are sent without waiting for each response. It aims to improve network efficiency by reducing latency, especially in high-latency networks. Pipelining allows the client to send multiple requests in quick succession over a single TCP connection before receiving any responses. However, its use is limited due to compatibility issues and server and proxy configuration complexities.

### 504 Gateway Timeout Error

A **504 Gateway Timeout** error indicates that a server acting as a gateway or proxy did not receive a timely response from an upstream server it needed to access in order to complete the request. This typically occurs when the server attempting to fulfill the request did not receive a response within a certain time frame from another server. Common reasons include overloaded servers, slow database queries, or network issues between servers.

### Proxy

A **proxy** is an intermediary server that acts as an intermediary between clients (such as web browsers) and other servers (such as web servers). Proxies are commonly used for various purposes including improving performance, filtering content, controlling access, and enhancing security.

### Reverse Proxy

A **reverse proxy** is a type of proxy server that sits between client devices (like browsers) and backend servers. Unlike regular proxies that forward client requests to the server, reverse proxies receive requests from clients and then forward them to the appropriate backend servers. Reverse proxies are often used to distribute client requests across multiple servers, improve performance, and provide additional security features such as hiding server details and filtering malicious requests.

### Software Licenses

There are several types of software licenses, each with its own terms and conditions regarding the use, modification, and distribution of software. Common types include:

1. **Open Source Licenses**: These licenses allow users to freely use, modify, and distribute the software as long as they adhere to certain conditions, typically related to preserving the open-source nature of the software. Examples include the MIT License, Apache License, and GNU General Public License (GPL).

2. **Proprietary Licenses**: Proprietary licenses restrict the use, modification, and distribution of software based on terms set by the software owner or developer. Users typically need to purchase a license or agree to terms that restrict certain actions.

3. **Permissive Licenses**: These licenses are open source but have minimal restrictions on how the software can be used, modified, or distributed. They often require attribution to the original author but are otherwise quite permissive.

4. **Copyleft Licenses**: Copyleft licenses are a type of open-source license that requires any modifications or derivatives of the original software to be released under the same license terms as the original. The GNU GPL is a well-known example of a copyleft license.

### X-Forwarded-For

**X-Forwarded-For** (XFF) is a HTTP header field that is used to identify the originating IP address of a client connecting to a web server through an HTTP proxy or a load balancer. It is used in scenarios where the client's IP address is masked by an intermediary (such as a proxy server or a load balancer) and the server needs to know the real client's IP address for logging, security, or other purposes.

When a request passes through a proxy or a load balancer, the proxy typically adds the X-Forwarded-For header to the HTTP request with the IP address of the client. This allows the backend server to see the original IP address of the client rather than the IP address of the proxy, which is crucial for various tasks such as geolocation, access control, and debugging.

