# 🍕 Pizza Hut Sales Data Analysis using SQL

## 📊 Project Overview

The analysis simulates a real-world scenario where a fast-food chain like Pizza Hut wants to evaluate its business performance based on **sales, product popularity, and consumer behavior**. Key objectives include:

- Calculating total sales and order volume  
- Identifying high-performing pizza types and sizes  
- Understanding hourly and daily ordering patterns  
- Evaluating revenue contribution by pizza category  
- Generating category-wise and time-based insights  

---

## 🧰 Tools & Technologies Used

- **SQL (MySQL)**
- **Database Design & Joins**
- **Window Functions**
- **Aggregate Functions (SUM, COUNT, AVG)**
- **Subqueries & CTEs**
- **Ranking & Partitioning**

---

## 🗂️ Database Structure

- **Database Name**: `pizzahut`
- **Tables Created**:
  - `orders` – order_id, order_date, order_time
  - `orders_details` – order_detail_id, order_id, pizza_id, quantity
  - `pizzas` – pizza_id, size, price, pizza_type_id
  - `pizza_types` – pizza_type_id, name, category

---

## 🔍 Key SQL Insights & Queries

### 📌 Basic Metrics
- **Total Orders Placed**: Count of orders to understand business scale.
- **Total Revenue Generated**: Based on quantity × unit price using JOINs.
- **Highest Priced Pizza**: Identifying premium products.

### 📊 Product-Level Insights
- **Most Common Pizza Size**: Helps in inventory and supply chain decisions.
- **Top 5 Most Ordered Pizza Types**: Guides promotions and marketing.
- **Top Pizza Types by Revenue**: Aligns product focus with profit generation.

### 📂 Category-Level Analysis
- **Quantity by Pizza Category**: Vegetarian, Non-Vegetarian, Classic, etc.
- **Category-wise Revenue Contribution (%)**: Helps in financial planning.
- **Top 3 Pizzas by Revenue for Each Category**: Refined segmentation strategy.

### ⏱️ Time-Based Analysis
- **Hourly Order Distribution**: Identifies peak business hours.
- **Daily Average Pizzas Ordered**: Tracks demand trends.
- **Cumulative Revenue Over Time**: Useful for forecasting and planning.

---

## 📈 Sample Output Insights

- 🧀 **Most ordered size**: Medium  
- 🥇 **Top pizza type**: BBQ Chicken  
- ⏰ **Peak order hour**: 6 PM – 8 PM  
- 💰 **Top revenue-generating category**: Classic  
- 📅 **Revenue trends** show strong weekend sales, aiding campaign planning

---

## 💡 Why This Project Stands Out

✅ Realistic, business-focused problem-solving  
✅ Advanced SQL usage: **Window functions, Ranking, Subqueries**  
✅ Clear structure: from database creation to strategic insights  
✅ Excellent showcase of **data-driven thinking** for analytics and BI roles  

