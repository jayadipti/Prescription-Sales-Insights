#1. Top-Selling Drugs (by units sold)
SELECT 
    d.drug_name,
    SUM(s.units_sold) AS total_units
FROM sales s
JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drug_name
ORDER BY total_units DESC
LIMIT 10;

# 2. Monthly Sales Trends
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    SUM(s.units_sold) AS monthly_units
FROM sales s
GROUP BY sale_month
ORDER BY sale_month;

#3.Top Prescribers by Units Sold
SELECT 
    p.prescriber_name,
    SUM(s.units_sold) AS total_units
FROM sales s
JOIN prescribers p ON s.prescriber_id = p.prescriber_id
GROUP BY p.prescriber_name
ORDER BY total_units DESC
LIMIT 10;

# 4. Top Pharmacies by Revenue Potential
SELECT 
    ph.pharmacy_name,
    SUM(s.units_sold * d.price_per_unit) AS total_revenue
FROM sales s
JOIN pharmacies ph ON s.pharmacy_id = ph.pharmacy_id
JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY ph.pharmacy_name
ORDER BY total_revenue DESC
LIMIT 10;

#5. Drug Popularity per Pharmacy
SELECT 
    ph.pharmacy_name,
    d.drug_name,
    SUM(s.units_sold) AS total_units
FROM sales s
JOIN pharmacies ph ON s.pharmacy_id = ph.pharmacy_id
JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY ph.pharmacy_name, d.drug_name
ORDER BY ph.pharmacy_name, total_units DESC;

#6. Prescriber Specialization Analysis
SELECT 
    p.specialty,
    SUM(s.units_sold) AS total_units
FROM sales s
JOIN prescribers p ON s.prescriber_id = p.prescriber_id
GROUP BY p.specialty
ORDER BY total_units DESC;

#7.Average Units Sold per Transaction
SELECT 
    ROUND(AVG(units_sold), 2) AS avg_units_per_sale
FROM sales;

#8.Running Total of Sales
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
        SUM(units_sold) AS monthly_units
    FROM sales
    GROUP BY sale_month
)
SELECT 
    sale_month,
    monthly_units,
    SUM(monthly_units) OVER (ORDER BY sale_month) AS running_total
FROM monthly_sales;

 #9.Drug Sales Ranking per Month
 WITH monthly_drug_sales AS (
    SELECT 
        DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
        d.drug_name,
        SUM(s.units_sold) AS total_units
    FROM sales s
    JOIN drugs d ON s.drug_id = d.drug_id
    GROUP BY sale_month, d.drug_name
)
SELECT 
    sale_month,
    drug_name,
    total_units,
    RANK() OVER (PARTITION BY sale_month ORDER BY total_units DESC) AS rank_in_month
FROM monthly_drug_sales
ORDER BY sale_month, rank_in_month;

#10.Yearly Growth Rate
WITH yearly_sales AS (
    SELECT 
        YEAR(sale_date) AS sale_year,
        SUM(units_sold) AS total_units
    FROM sales
    GROUP BY sale_year
)
SELECT 
    sale_year,
    total_units,
    ROUND(
        (total_units - LAG(total_units) OVER (ORDER BY sale_year)) /
         LAG(total_units) OVER (ORDER BY sale_year) * 100, 2
    ) AS growth_rate_percentage
FROM yearly_sales;

#11.Year-over-Year (YoY) Growth in Sales
SELECT 
    YEAR(sale_date) AS year,
    SUM(units_sold) AS total_units,
    ROUND(
        (SUM(units_sold) - LAG(SUM(units_sold)) OVER (ORDER BY YEAR(sale_date))) 
        / LAG(SUM(units_sold)) OVER (ORDER BY YEAR(sale_date)) * 100, 2
    ) AS yoy_growth_percent
FROM sales
GROUP BY YEAR(sale_date)
ORDER BY year;

# 12.Prescriber Loyalty Score (How concentrated are their drug prescriptions?)
SELECT 
    prescriber_id,
    COUNT(DISTINCT drug_id) AS unique_drugs_prescribed,
    SUM(units_sold) AS total_units_sold,
    ROUND(SUM(units_sold) / COUNT(DISTINCT drug_id), 2) AS avg_units_per_drug
FROM sales
GROUP BY prescriber_id
ORDER BY avg_units_per_drug DESC;
#13. Best Pharmacy-Drug Combination
SELECT 
    pharmacy_id,
    drug_id,
    SUM(units_sold) AS total_units
FROM sales
GROUP BY pharmacy_id, drug_id
ORDER BY total_units DESC
LIMIT 10;

#14. Monthly Trend with Rolling Average
WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(units_sold) AS total_units
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT 
    month,
    total_units,
    ROUND(AVG(total_units) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_3_month_avg
FROM monthly_sales;

#15. Identify Seasonal Demand Peaks
SELECT 
    MONTH(sale_date) AS month,
    SUM(units_sold) AS total_units
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY total_units DESC;

#16. Drug Dependency Ratio per Pharmacy

WITH total_sales_per_pharmacy AS (
    SELECT pharmacy_id, SUM(units_sold) AS total_units
    FROM sales
    GROUP BY pharmacy_id
),
drug_sales AS (
    SELECT pharmacy_id, drug_id, SUM(units_sold) AS drug_units
    FROM sales
    GROUP BY pharmacy_id, drug_id
)
SELECT 
    d.pharmacy_id,
    d.drug_id,
    d.drug_units,
    t.total_units,
    ROUND(d.drug_units / t.total_units * 100, 2) AS dependency_percent
FROM drug_sales d
JOIN total_sales_per_pharmacy t
ON d.pharmacy_id = t.pharmacy_id
ORDER BY dependency_percent DESC;


#17. Average units sold per sale
SELECT 
    d.drug_name,
    ROUND(AVG(s.units_sold), 2) AS avg_units_per_sale
FROM sales s
JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drug_name
ORDER BY avg_units_per_sale DESC;

#18.First & last sale date for each drug
SELECT 
    d.drug_name,
    MIN(s.sale_date) AS first_sale,
    MAX(s.sale_date) AS last_sale
FROM sales AS s
JOIN drugs AS d 
    ON s.drug_id = d.drug_id
GROUP BY d.drug_name
ORDER BY d.drug_name;



#19. Number of unique prescribers per drug
SELECT 
    d.drug_name,
    COUNT(DISTINCT s.prescriber_id) AS unique_prescribers
FROM sales s
JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drug_name
ORDER BY unique_prescribers DESC;


#20.  Total sales per city
SELECT 
    p.city,
    SUM(s.units_sold) AS total_units
FROM sales s
JOIN pharmacies p ON s.pharmacy_id = p.pharmacy_id
GROUP BY p.city
ORDER BY total_units DESC;

