USE prescription_sales;


CREATE TABLE drugs (
    drug_id INT PRIMARY KEY AUTO_INCREMENT,
    drug_name VARCHAR(100),
    drug_category VARCHAR(50),
    price_per_unit DECIMAL(8,2)
);


CREATE TABLE prescribers (
    prescriber_id INT PRIMARY KEY AUTO_INCREMENT,
    prescriber_name VARCHAR(100),
    specialty VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE pharmacies (
    pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE,
    drug_id INT,
    prescriber_id INT,
    pharmacy_id INT,
    units_sold INT,
    FOREIGN KEY (drug_id) REFERENCES drugs(drug_id),
    FOREIGN KEY (prescriber_id) REFERENCES prescribers(prescriber_id),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id)
);
INSERT INTO drugs (drug_name, drug_category, price_per_unit) VALUES
('Paracetamol', 'Painkiller', 0.50),
('Amoxicillin', 'Antibiotic', 1.20),
('Atorvastatin', 'Cholesterol', 2.50),
('Metformin', 'Diabetes', 1.80),
('Omeprazole', 'Acid Reflux', 1.00);

INSERT INTO prescribers (prescriber_name, specialty, city, state) VALUES
('Dr. Rajesh Kumar', 'General', 'Mumbai', 'Maharashtra'),
('Dr. Priya Sharma', 'Cardiology', 'Delhi', 'Delhi'),
('Dr. Anil Mehta', 'Endocrinology', 'Bengaluru', 'Karnataka'),
('Dr. Sunita Gupta', 'Pediatrics', 'Pune', 'Maharashtra'),
('Dr. Mohan Iyer', 'Neurology', 'Hyderabad', 'Telangana'),
('Dr. Kavita Desai', 'General', 'Ahmedabad', 'Gujarat'),
('Dr. Arjun Reddy', 'Cardiology', 'Chennai', 'Tamil Nadu'),
('Dr. Neha Verma', 'General', 'Kolkata', 'West Bengal'),
('Dr. Suresh Patil', 'Endocrinology', 'Jaipur', 'Rajasthan'),
('Dr. Pooja Nair', 'Pediatrics', 'Lucknow', 'Uttar Pradesh');
INSERT INTO patients (patient_name, age, city, state) VALUES
('Amit Sharma', 45, 'Mumbai', 'Maharashtra'),
('Rita Singh', 32, 'Delhi', 'Delhi'),
('Sandeep Kumar', 50, 'Bengaluru', 'Karnataka'),
('Neha Joshi', 29, 'Pune', 'Maharashtra'),
('Vikram Rao', 60, 'Hyderabad', 'Telangana'),
('Sunita Patel', 40, 'Ahmedabad', 'Gujarat'),
('Raj Malhotra', 55, 'Chennai', 'Tamil Nadu'),
('Priya Das', 35, 'Kolkata', 'West Bengal'),
('Rohit Jain', 28, 'Jaipur', 'Rajasthan'),
('Meena Kapoor', 42, 'Lucknow', 'Uttar Pradesh');
INSERT INTO pharmacies (pharmacy_name, city, state) VALUES
('HealthPlus Pharmacy', 'Mumbai', 'Maharashtra'),
('MediCare Store', 'Delhi', 'Delhi'),
('CityCare Pharmacy', 'Bengaluru', 'Karnataka'),
('Wellness Drug House', 'Pune', 'Maharashtra'),
('GoodHealth Pharmacy', 'Hyderabad', 'Telangana'),
('LifeLine Pharmacy', 'Ahmedabad', 'Gujarat'),
('CarePoint Pharmacy', 'Chennai', 'Tamil Nadu'),
('MediTrust Pharmacy', 'Kolkata', 'West Bengal'),
('CureAll Pharmacy', 'Jaipur', 'Rajasthan'),
('TrueHealth Pharmacy', 'Lucknow', 'Uttar Pradesh');

WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 1000
)
SELECT * FROM seq;


INSERT INTO sales (sale_date, drug_id, prescriber_id, pharmacy_id, units_sold)
SELECT
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY) AS sale_date,
    FLOOR(1 + RAND() * 5) AS drug_id,        
    FLOOR(1 + RAND() * 5) AS prescriber_id,  
    FLOOR(1 + RAND() * 5) AS pharmacy_id,    
    FLOOR(1 + RAND() * 50) AS units_sold      
FROM (
    SELECT 0 AS n
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
) d1
CROSS JOIN (
    SELECT 0 AS n
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
) d2
CROSS JOIN (
    SELECT 0 AS n
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
) d3
CROSS JOIN (
    SELECT 0 AS n
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
) d4









