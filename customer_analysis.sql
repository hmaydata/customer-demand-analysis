-- DATA CLEANING

DROP VIEW IF EXISTS clean_transactions;

CREATE VIEW clean_transactions AS
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS Revenue,
    CustomerID,
    Country,

    -- Remove time component from date
    SUBSTR(InvoiceDate, 1, INSTR(InvoiceDate, ' ') - 1) AS CleanDate

FROM transactions
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0;

SELECT COUNT(*) AS total_rows FROM clean_transactions;

SELECT * 
FROM clean_transactions
LIMIT 10;


-- SECTION 1: REVENUE CONCENTRATION

WITH customer_spend AS (
    SELECT
        CustomerID,
        SUM(Revenue) AS total_spent
    FROM clean_transactions
    GROUP BY CustomerID
)

SELECT
    CustomerID,
    total_spent,
    SUM(total_spent) OVER () AS total_revenue,
    SUM(total_spent) OVER (ORDER BY total_spent DESC) * 1.0
        / SUM(total_spent) OVER () AS cumulative_share
FROM customer_spend
ORDER BY total_spent DESC;

-- SECTION 2: CUSTOMER RETENTION

WITH customer_orders AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS num_orders
    FROM clean_transactions
    GROUP BY CustomerID
)

SELECT
    CASE
        WHEN num_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_type;

-- SECTION 3: DEMAND TRENDS

WITH monthly_data AS (
    SELECT
        CASE 
            WHEN LENGTH(SUBSTR(CleanDate, 1, INSTR(CleanDate, '/') - 1)) = 1
                THEN SUBSTR(CleanDate, -4) || '-0' || SUBSTR(CleanDate, 1, 1)
            ELSE SUBSTR(CleanDate, -4) || '-' || SUBSTR(CleanDate, 1, 2)
        END AS Month,
        Revenue
    FROM clean_transactions
)

SELECT
    Month,
    SUM(Revenue) AS monthly_revenue
FROM monthly_data
GROUP BY Month
ORDER BY Month;

-- SECTION 4: CUSTOMER LIFETIME VALUE

SELECT
    CustomerID,
    SUM(Revenue) AS lifetime_value,
    COUNT(DISTINCT InvoiceNo) AS num_orders
FROM clean_transactions
GROUP BY CustomerID
ORDER BY lifetime_value DESC;

-- SECTION 5: COHORT ANALYSIS

WITH customer_cohorts AS (
    SELECT
        CustomerID,
        MIN(SUBSTR(CleanDate, 1, INSTR(CleanDate, '/') - 1)) AS first_month,
        COUNT(DISTINCT InvoiceNo) AS num_orders
    FROM clean_transactions
    GROUP BY CustomerID
)

SELECT
    first_month,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN num_orders > 1 THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*) AS return_rate
FROM customer_cohorts
GROUP BY first_month
ORDER BY first_month;
