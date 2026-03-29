# 📊 Customer Demand Dynamics and Revenue Analysis (SQL)
## Overview
This project analyzes transactional e-commerce data using SQL to evaluate customer behavior, revenue concentration, and demand stability. The goal is to move beyond simple aggregations and provide a structured, business-oriented analysis of how customers generate revenue over time.

## Executive Summary
Revenue is highly concentrated among a small subset of customers, creating potential fragility in the business model. While repeat purchasing is common, a significant share of customers transact only once, indicating continued reliance on customer acquisition.

Demand exhibits strong seasonality, with revenue peaking in the fall months and declining sharply after the holiday period. Notably, peak activity occurs prior to December, reflecting advance purchasing behavior in e-commerce.

Customer value varies widely across the customer base, with no consistent relationship between purchase frequency and total spending. Cohort analysis further shows that retention differs significantly by acquisition timing, with early-year and pre-holiday customers demonstrating stronger persistence than mid-year cohorts.

Overall, the business depends on a combination of high-value customers, repeat purchasing behavior, and seasonal demand cycles, introducing both growth opportunities and structural risk.

## Key Questions
- Is revenue concentrated among a small group of customers?
- Does the business rely more on retention or acquisition?
- Is demand stable or seasonal?
- How does customer value vary across customers?
- Does customer retention differ based on when customers are acquired?

## Data & Methodology
- **Dataset:** UCI Online Retail dataset
- **Tooling:** SQLite
- **Techniques Used:**
  -  Data cleaning using SQL views
  -  Aggregation and grouping
  -  Window functions for distribution analysis
  -  Time-based analysis
  -  Cohort-style retention analysis

## Analysis
### 🔹 Revenue Concentration
Revenue is heavily concentrated among top customers, with a small share of customers accounting for a disproportionate amount of total revenue. The cumulative revenue distribution rises quickly among top spenders, indicating a long-tail structure and potential dependence on high-value customers.

### 🔹 Customer Retention
Approximately two-thirds of customers make repeat purchases, while one-third transact only once. This indicates moderate retention but continued reliance on acquiring new customers to sustain revenue.

### 🔹 Demand Trends
Revenue follows a clear seasonal pattern, increasing through the year and peaking in the fall months (September–November) before declining sharply after the holiday period. Peak demand occurs prior to December, consistent with advance purchasing behavior in e-commerce.

### 🔹 Customer Lifetime Value
Customer value varies significantly, with no consistent relationship between purchase frequency and total spending. Some customers generate high revenue through frequent purchases, while others contribute large amounts through a small number of transactions. This suggests a heterogeneous customer base with multiple purchasing behaviors.

### 🔹 Cohort-Based Retention
Customer retention varies significantly by acquisition month. Customers acquired in January and during pre-holiday months exhibit higher return rates, while mid-year cohorts show weaker persistence. This indicates that customer quality is time-dependent and influenced by seasonal factors.

## Key Takeaways
- Revenue concentration introduces potential vulnerability to customer churn
- Retention is present but uneven across the customer base
- Demand is highly seasonal and time-dependent
- Customer behavior is heterogeneous, with multiple distinct purchasing patterns
- Customer value and retention vary significantly by acquisition timing

## Limitations
- No customer demographic information available
- No product categorization or margin data
- Cannot distinguish between consumer and business customers
- Analysis is observational and does not imply causation

## How to Use this Project
1. Review the SQL queries in [customer_analysis.sql](customer_analysis.sql)
2. Follow each section to understand how insights were generated
3. Use the analysis as a framework for business or economic data exploration

## Author's Note
This project was developed as part of a data analytics portfolio to demonstrate the ability to translate raw transactional data into meaningful business insights using SQL.
