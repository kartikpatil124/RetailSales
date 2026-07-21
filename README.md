<div align="center">

# 📊 Retail Sales Analytics Dashboard

### End-to-End Data Analytics Project using MySQL & Power BI

<img src="YOUR_DASHBOARD_IMAGE_LINK" width="100%" alt="Retail Sales Dashboard"/>

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-FFB000?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-success?style=for-the-badge)

</div>

---

# 📌 Project Overview

This project demonstrates an **end-to-end Retail Sales Analytics solution** built using **MySQL** and **Power BI**.

The objective of this project is to transform raw retail sales data into meaningful business insights through SQL analysis, data modeling, DAX measures, and interactive dashboards.

The dashboard enables businesses to monitor sales performance, customer behavior, product performance, and shipping efficiency.

---

# 🎯 Business Objectives

- Analyze overall business performance
- Track revenue and sales trends
- Identify top-performing products
- Understand customer purchasing behavior
- Analyze state-wise revenue
- Evaluate shipping performance
- Generate business insights for decision-making

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|----------|
| MySQL | Data Storage & SQL Analysis |
| SQL | Data Exploration & Business Queries |
| Power BI | Dashboard Development |
| DAX | KPI Calculations |
| Power Query | Data Transformation |

---

# 📂 Dataset

The project consists of **5 relational tables**.

| Table | Description |
|---------|-------------|
| Customers | Customer Information |
| Orders | Order Details |
| Order Items | Product Transactions |
| Products | Product Information |
| Shipping | Shipping Details |

---

# 🗄 Database Schema

```
Customers
     │
     │ Customer_ID
     ▼
Orders
     │
     ├───────────────┐
     ▼               ▼
Order_Items      Shipping
     │
     │ Product_ID
     ▼
Products
```

---

# 📊 SQL Analysis Performed

### Data Exploration

- Total Customers
- Total Orders
- Total Products
- Most Frequently Ordered Products
- Average Order Value (AOV)
- Revenue by Month
- Revenue by Year
- Top 5 States by Revenue

---

### Customer Analysis

- Monthly Customer Growth
- Top 10 Customers by Lifetime Value
- Gender-wise Spending
- Customer Churn Analysis

---

### Product Analysis

- Best Selling Products
- Revenue by Product
- Revenue by Category
- Profit Margin Analysis
- Underperforming Products

---

### Shipping Analysis

- Average Shipping Time
- Shipping Cost Analysis
- Delivery Status Analysis

---

### Advanced SQL Concepts Used

- INNER JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions
- CASE WHEN
- RANK()
- ROW_NUMBER()
- LAG()
- LEAD()
- DATE_FORMAT()
- DATEDIFF()

---

# 📈 Power BI Dashboard

The dashboard contains multiple business-focused pages.

## 🏠 Executive Dashboard

- Total Revenue
- Total Orders
- Total Customers
- Total Products
- Average Order Value
- Monthly Revenue Trend
- Top 5 States by Revenue
- Revenue by Category

---

## 👥 Customer Analysis

- Customer Lifetime Value
- Gender-wise Spending
- Customer Growth
- Customer Insights

---

## 📦 Product Analysis

- Best Selling Products
- Revenue by Product
- Category Performance
- Profit Analysis

---

## 🚚 Shipping Analysis

- Shipping Status
- Average Shipping Cost
- Average Shipping Time
- Delivery Performance

---

# 📐 Data Model

Power BI relationships were created between all five tables using Primary Key and Foreign Key relationships.

```
Customers (1)
      │
      ▼
Orders (Many)
      │
      ▼
Order Items (Many)
      │
      ▼
Products (1)

Orders (1)
      │
      ▼
Shipping (1)
```

---

# 📊 KPIs

- 💰 Total Revenue
- 🛒 Total Orders
- 👥 Total Customers
- 📦 Total Products
- 📈 Average Order Value
- 🚚 Average Shipping Time
- ⭐ Best Selling Products
- 🌍 Revenue by State

---

# 📸 Dashboard Preview

> Replace the image below with your exported Power BI dashboard.

<img width="3075" height="1763" alt="RetailSales_dashboard_page-0001" src="https://github.com/user-attachments/assets/3d9bf145-f98d-42ed-be04-740df006a68e" />


---

# 🚀 How to Run

### 1. Clone Repository

```bash
git clone https://github.com/kartikpatil124/RetailSales.git
```

### 2. Import Database

Import the SQL files into MySQL Workbench.

### 3. Open Power BI

Open the `.pbix` file.

### 4. Refresh Data

Connect Power BI to your MySQL database.

### 5. Explore Dashboard

Interact with filters, slicers, and visualizations.

---

# 📁 Project Structure

```
RetailSales
│
├── customers.sql
├── orders.sql
├── order_items.sql
├── products.sql
├── shipping.sql
├── analysis.sql
├── RetailSales.pbix
├── README.md
└── Dashboard.png
```

---

# 💡 Skills Demonstrated

- SQL
- MySQL
- Data Cleaning
- Data Modeling
- Power BI
- DAX
- Data Visualization
- Business Intelligence
- Dashboard Design
- Data Analysis

---

# 📚 Key Learnings

- Writing optimized SQL queries
- Working with relational databases
- Building Power BI data models
- Creating DAX measures
- Designing interactive dashboards
- Transforming raw data into business insights

---

# 👨‍💻 Author

## Kartik Patil

B.Tech Computer Science Student | Aspiring Data Analyst

- 💼 LinkedIn: *(Add your LinkedIn profile)*
- 🌐 Portfolio: *(Add your Portfolio link)*
- 📧 Email: *(Add your Email)*

---

<div align="center">

### ⭐ If you found this project helpful, please consider giving it a Star!

</div>
