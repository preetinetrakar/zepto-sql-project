🛒 Zepto SQL Data Analysis Project
📌 Project Overview

This project analyzes a Zepto-like product dataset using SQL to extract meaningful business insights related to pricing, discounts, and inventory.

🎯 Objectives
Analyze product pricing and discounts
Identify best value products
Understand inventory and stock availability
Generate category-wise business insights
🛠 Tools & Technologies
PostgreSQL
SQL

📊 Key Business Questions Solved
Top 10 products with highest discount
High MRP but out-of-stock products
Estimated revenue per category
Expensive products with low discount
Top 5 categories with highest average discount
Best value products (price per gram)
Product categorization (Low, Medium, Bulk)
Total inventory weight per category

💻 Sample SQL Query
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

📈 Key Insights
Fruits & Vegetables offer the highest average discounts
Some high-value products are out of stock
Best value products identified using price per gram
Revenue varies significantly across categories

📁 Project Structure
zepto-sql-project/
│
├── zepto_analysis.sql
├── README.md

🚀 How to Use
Open PostgreSQL / pgAdmin
Create the zepto table
Run the SQL queries from zepto_analysis.sql
Analyze outputs


⭐ If you like this project
Give it a ⭐ on GitHub!
