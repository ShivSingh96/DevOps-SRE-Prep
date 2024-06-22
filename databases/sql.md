### SQL Self Assessment

#### What is SQL?
SQL (Structured Query Language) is a standardized programming language used for managing and querying relational databases. It allows users to interact with databases by defining and manipulating data, retrieving information, and performing various operations like insertions, updates, deletions, and creating schemas and tables.

#### How is SQL Different from NoSQL?
**SQL:**
- SQL databases are relational, meaning they use structured schemas and tables.
- Data is stored in rows and columns.
- SQL databases are suitable for applications requiring complex queries and transactions, like banking systems, e-commerce, and financial applications.

**NoSQL:**
- NoSQL databases are non-relational and store data in various ways: key-value pairs, document-based, graph databases, or column-oriented.
- NoSQL databases are more flexible and scalable, making them suitable for big data, real-time web applications, and scenarios where data structure can evolve rapidly.

#### When is it best to use SQL? NoSQL?
**SQL:**
- Use SQL when you need a structured schema with predefined relationships between data entities.
- When you require ACID (Atomicity, Consistency, Isolation, Durability) transactions.
- Suitable for complex queries, reporting, and applications with predefined data models.

**NoSQL:**
- Use NoSQL when you need flexible schema design and scalability.
- When dealing with unstructured or semi-structured data.
- Suitable for agile development, real-time applications, and scenarios where horizontal scaling is crucial.

### Practical SQL - Basics

Given the `Customers` and `Orders` tables:

**Customers Table:**
```
Customer_ID   Customer_Name   Items_in_cart   Cash_spent_to_Date
---------------------------------------------------------------
100204        John Smith      0               20.00
100205        Jane Smith      3               40.00
100206        Bobby Frank     1               100.20
```

**Orders Table:**
```
Customer_ID   Order_ID   Item                      Price   Date_sold
---------------------------------------------------------------------
100206        A123       Rubber Ducky              2.20    2019-09-18
100206        A123       Bubble Bath               8.00    2019-09-18
100206        Q987       80-Pack TP                90.00   2019-09-20
100205        Z001       Cat Food - Tuna Fish      10.00   2019-08-05
100205        Z001       Cat Food - Chicken        10.00   2019-08-05
100205        Z001       Cat Food - Beef           10.00   2019-08-05
100205        Z001       Cat Food - Kitty quesadilla 10.00 2019-08-05
100204        X202       Coffee                    20.00   2019-04-29
```

1. **How would I select all fields from this table?**
   ```sql
   SELECT * FROM Customers;
   SELECT * FROM Orders;
   ```

2. **How many items are in John's cart?**
   ```sql
   SELECT Items_in_cart FROM Customers WHERE Customer_Name = 'John Smith';
   -- Result: 0
   ```

3. **What is the sum of all the cash spent across all customers?**
   ```sql
   SELECT SUM(Cash_spent_to_Date) FROM Customers;
   -- Result: 160.20
   ```

4. **How many people have items in their cart?**
   ```sql
   SELECT COUNT(*) FROM Customers WHERE Items_in_cart > 0;
   -- Result: 2 (Jane Smith and Bobby Frank)
   ```

5. **How would you join the customer table to the order table?**
   To join based on `Customer_ID`:
   ```sql
   SELECT Customers.Customer_ID, Customer_Name, Items_in_cart, Cash_spent_to_Date,
          Orders.Order_ID, Item, Price, Date_sold
   FROM Customers
   JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;
   ```

6. **How would you show which customer ordered which items?**
   ```sql
   SELECT Customer_Name, Item, Price, Date_sold
   FROM Customers
   JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;
   ```

7. **Using a WITH statement, how would you show who ordered cat food, and the total amount of money spent?**
   ```sql
   WITH CatFoodOrders AS (
       SELECT Customer_Name, Item, Price
       FROM Customers
       JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
       WHERE Item LIKE 'Cat Food%'
   )
   SELECT Customer_Name, SUM(Price) AS Total_spent
   FROM CatFoodOrders
   GROUP BY Customer_Name;
   ```

8. **Which of the following queries would you use?**
   I would use:
   ```sql
   SELECT count(*)
   FROM shawarma_purchases
   WHERE YEAR(purchased_at) = '2017';
   ```
   Explanation: The correct syntax for comparing the year in SQL is `YEAR(date_column) = 'YYYY'`. The second query's condition should use `AND` instead of a period between the two dates.

These answers cover the basics of SQL querying using the provided tables. If you have more questions or need further clarification, feel free to ask!

