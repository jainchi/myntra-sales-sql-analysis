# myntra-sales-sql-analysis
SQL-based analysis of e-commerce sales dataset to derive business insights


# Myntra Sales Data Analysis (SQL)

## 📌 Project Overview
This project involves a comprehensive exploratory data analysis (EDA) of a Myntra sales dataset using SQL. The goal was to extract actionable business insights regarding brand performance, pricing strategies, and customer satisfaction.

## 📊 Key Business Questions Answered
* **Brand Performance:** Which brands dominate in terms of sales volume and revenue?
* **Discount Strategy:** Is there a correlation between high discounts and low product ratings?
* **Customer Preferences:** Which categories see the most variety in sizing and gender-based demand?
* **Inventory Insights:** Identifying brands with zero sales and high-variety categories.

## 🛠️ SQL Techniques Used
* **Aggregations:** `SUM`, `COUNT`, `AVG`, `MIN/MAX`.
* **Window Functions:** `RANK()`, `DENSE_RANK()` for top-performing brands.
* **Data Cleaning:** `UNNEST` and `string_to_array` for handling multi-value size options.
* **Conditional Logic:** `CASE` statements for price and discount segmentation.

## 💡 Key Insights
1.  **The Discount Trap:** Identified products with >70% discounts but <3.0 ratings, highlighting potential quality issues.
2.  **Gender Trends:** Analysis confirmed Women's categories lead in volume, but Men's categories often maintain different pricing benchmarks.
3.  **Pricing Segments:** Categorized products into Low, Medium, and High price tiers to analyze average ratings across price points.

## 🚀 How to Run the Scripts
1.  Ensure you have a PostgreSQL or compatible SQL environment.
2.  Run the `table_creation.sql` script to set up the schema.
3.  Execute the analysis queries to generate reports.
---

## 🙋‍♂️ Author
Chitransh Jain
