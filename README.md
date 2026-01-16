# Retail SQL Analytics Project

## About This Project

This project is created to practice and show how SQL is used in a real retail business scenario.

In this project, I worked with retail data such as customers, products, orders, order items, and payments.
I designed the database, loaded raw data, wrote SQL queries, and generated insights from the data.

The main focus of this project is learning and demonstrating SQL in a practical way.

---

## What This Project Covers

- Creating a database and tables
- Defining relationships between tables
- Loading raw CSV data into the database
- Writing basic SQL queries
- Writing joins and business queries
- Writing advanced SQL queries
- Creating charts based on SQL results

---

## Project Folder Structure
```
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
```


---

## Database Design (1_schema)

### create_tables.sql

This file creates the database and all required tables:
- customers
- products
- orders
- order_items
- payments

Each table uses proper primary keys and foreign keys.

---

### table_relationships.sql

This file explains how tables are connected:

- One customer can place many orders
- One order can have many order items
- One product can appear in many order items
- Each order has payment information

---

## Raw Data Files (2_data)

This folder contains raw CSV files used in the project.
No data cleaning is performed.

---

## Data Loading (3_data_loading)

The `copy_commands.sql` file loads CSV data into PostgreSQL tables using COPY commands.

---

## SQL Queries (4_queries)

### basic_queries.sql
Simple checks and validations.

### joins.sql
Queries using joins across multiple tables.

### business_insights.sql
Queries that answer business-related questions.

### advanced.sql
Advanced SQL concepts like CTEs and window functions.

---

## Insights and Charts (5_insights)

This folder contains charts created from SQL query results:
- Revenue by category
- Monthly revenue trends
- Top products
- Payment mode distribution
- Table relationship diagram


---

## Final Note

This project shows practical SQL skills using a realistic retail dataset.
It is structured to be easy to understand and review.

---

##  Author
**Divyy Pratap**  
 Data Analyst
