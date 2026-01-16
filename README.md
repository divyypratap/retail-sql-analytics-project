
Retail SQL Analytics Project
About This Project
This project is created to practice and show how SQL is used in a real retail business scenario.
In this project, I worked with retail data such as customers, products, orders, order items, and payments.
I designed the database, loaded raw data, wrote SQL queries, and generated insights from the data.
The main focus of this project is learning and demonstrating SQL, not just writing queries but understanding how data flows in a real system.
________________________________________
What This Project Covers
Creating a database and tables
Defining relationships between tables
Loading raw CSV data into the database
Writing basic SQL queries
Writing joins and business queries
Writing advanced SQL queries
Creating charts based on SQL results
________________________________________
Project Folder Structure
retail-sql-analytics-project/
│
├── 1_schema/
│   ├── create_tables.sql
│   └── table_relationships.sql
│
├── 2_data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── payments.csv
│
├── 3_data_loading/
│   └── copy_commands.sql
│
├── 4_queries/
│   ├── basic_queries.sql
│   ├── joins.sql
│   ├── business_insights.sql
│   └── advanced.sql
│
├── 5_insights/
│   ├── revenue_by_category.png
│   ├── monthly_revenue_trend.png
│   ├── top_products.png
│   ├── payment_mode_distribution.png
│   └── table_relation.png
│
└── README.md
Each folder represents one step of the SQL workflow.
________________________________________
Database Design (1_schema)
create_tables.sql
This file is used to:
Create the database
Create all tables used in the project
Tables created:
customers
products
orders
order_items
payments
Each table has:
A primary key
Correct data types
Foreign keys where needed
This structure matches how retail systems usually store data.
________________________________________
table_relationships.sql
This file explains how tables are connected.
Relationships:
One customer can place many orders
One order can have many order items
One product can appear in many order items
Each order has payment details
This helps keep the data accurate and connected properly.
________________________________________
Raw Data Files (2_data)
This folder contains the original data in CSV format.
Files:
customers.csv
products.csv
orders.csv
order_items.csv
payments.csv
The data is not cleaned or modified.
It is loaded into the database exactly as it is.a
________________________________________
Data Loading (3_data_loading)
copy_commands.sql
This file contains SQL commands to load CSV data into tables.
It uses PostgreSQL COPY commands to:
Load data faster
Match CSV columns with table columns
Avoid manual inserts
This step shows how data is normally loaded in real projects.
________________________________________
SQL Queries (4_queries)
basic_queries.sql
Contains simple queries such as:
Counting rows
Checking data
Basic filtering
Used to confirm data is loaded correctly.
________________________________________
joins.sql
Contains queries that combine multiple tables.
Examples:
Customer orders
Order and product details
Revenue calculations
This section shows understanding of table relationships.
________________________________________
business_insights.sql
Contains queries that answer business questions like:
Which products sell the most?
Which customers spend the most?
Which category generates the highest revenue?
These queries focus on business thinking, not just SQL syntax.
________________________________________
advanced.sql
Contains advanced SQL concepts such as:
CTEs
Window functions
Ranking customers
Revenue trends
Customer segmentation
These queries are commonly asked in SQL interviews.
________________________________________
Insights and Charts (5_insights)
This folder contains images created from SQL query results.
Charts included:
Revenue by category
Monthly revenue trend
Top products by revenue
Payment mode distribution
Table relationship diagram
These charts help understand the data better.
________________________________________
Final Note
This project is made to be simple and realistic.
It shows practical SQL skills step by step.
Anyone viewing this project can clearly see:
How data is structured
How queries are written
How insights are generated

