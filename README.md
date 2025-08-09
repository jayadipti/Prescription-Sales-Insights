Prescription Sales Insights | SQL Project

 Project Overview

This project performs a comprehensive analysis of synthetic pharmaceutical sales data using advanced SQL techniques. The dataset simulates 10,000 prescription sales records, including drugs, prescribers, pharmacies, patients, and sales transactions.
The goal is to extract actionable insights such as top-selling drugs, prescriber behavior, pharmacy performance, patient demographics, and sales trends over time. This showcases expertise in SQL joins, aggregations, CTEs, and window functions on a realistic business dataset.


Key Features & Skills Demonstrated
- Design and creation of normalized database tables with foreign key constraints
- Data population with 10K+ synthetic records using SQL-only methods (recursive CTEs and cross joins)
- Complex SQL queries employing:
  - JOINs (INNER JOIN) to combine data from multiple tables
  - GROUP BYfor aggregation of sales metrics
  - Common Table Expressions (CTEs)for modular and readable queries
  - Window Functions like RANK(), SUM() OVER() for ranking and running totals
Analysis of:
  - Top-selling drugs and prescribers
  - Pharmacy revenue and drug dependencies
  - Patient demographics and prescribing patterns
  - Monthly and yearly sales trends and growth rates
  - Prescriber specialties and loyalty metrics


 Database Schema Overview

| Table Name    | Description                             |
|---------------|---------------------------------------|
| `drugs`       | Drug details (name, category, price)  |
| `prescribers` | Doctor info (name, specialty, location) |
| `pharmacies`  | Pharmacy details (name, location)     |
| `patients`    | Patient demographics (name, age, gender, city, state) |
| `sales`       | Sales transactions (date, units sold, foreign keys to all above) |


Sample Queries & Insights

- Top 10 Drugs by Units Sold
- Monthly Sales Trend and Running Totals
- Top Prescribers by Prescription Volume
- Pharmacy Revenue Rankings**
- Year-over-Year Sales Growth**
- Prescriber Specialty Analysis**

 Potential Use Cases

- Pharma companies analyzing drug performance and prescriber behavior
- Pharmacies optimizing inventory based on sales trends
- Market research on geographic sales distribution
- Academic projects on SQL analytical capabilities

