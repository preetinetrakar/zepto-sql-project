# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview

This project analyzes a Zepto-like product dataset using SQL to extract meaningful business insights related to pricing, discounts, and inventory.

---

## 🎯 Objectives

* Analyze product pricing and discounts
* Identify best value products
* Understand inventory and stock availability
* Generate category-wise business insights

---

## 🛠 Tools & Technologies

* PostgreSQL
* SQL

---

## 📊 Key Business Questions Solved

1. Top 10 products with highest discount
2. High MRP but out-of-stock products
3. Estimated revenue per category
4. Expensive products with low discount
5. Top 5 categories with highest average discount
6. Best value products (price per gram)
7. Product categorization (Low, Medium, Bulk)
8. Total inventory weight per category

---

## 💻 Sample SQL Query

```sql
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;
```

---

## 📈 Key Insights

* Fruits & Vegetables offer the highest average discounts
* Some high-value products are out of stock
* Best value products identified using price per gram
* Revenue varies significantly across categories

---

## 📁 Project Structure

```
zepto-sql-project/
│
├── zepto_analysis.sql
├── README.md
```

---

## 🚀 How to Use

1. Open PostgreSQL / pgAdmin
2. Create the `zepto` table
3. Run the SQL queries from `zepto_analysis.sql`
4. Analyze outputs

---

## 👩‍💻 Author

**Preeti Netrakar**

---

## ⭐ If you like this project

Give it a ⭐ on GitHub!
