# Cafe-Sales-Analysis
End-to-end cafe sales analysis using SQL,Power BI and Dax

## Objective
To analyze café sales performance over a one-year period in order to identify revenue trends, volatility patterns, and potential operational or market-driven causes behind fluctuations.

## Dataset
The dataset contains transactional sales records including:
- Item
- Revenue
- Transaction Date
- Quantity Sold
- Price per unit

## Data Cleaning Process using SQL
Key steps included:
- Created a working table from the raw dataset to preserve the original data.
- Renamed columns following consistent naming conventions.
- Identified and checked for duplicate records using a Window Function and CTE.
- Handled missing and inconsistent data inlcuding:
     * Null values
     * Unknown entries
     * Incorrect data type formatting
- Dropped unusable or irrelevant columns.
- Converted the date column to the appropriate DATE data type to enable time-based analysis.
This ensured the dataset was reliable for modeling in Power BI.

## Key Analysis Performed
- Monthly revenue trend analysis
- Revenue vs Quantity trend comparison
- Product-level contribution analysis
- Investigation of volatility patterns
- Time intelligence measures were created using DAX to evaluate period-over-period changes

## Key Insights
- Monthly revenue displayed significant volatility, with alternating increases and decreases throughout the year.
- Brief stabilization periods were observed in April and August before volatility resumed.
- Item-level analysis showed similar fluctuation patterns across multiple products.
- Because the decline was not concentrated in select items, the volatility likely reflects broader market dynamics rather than product-    specific issues.

## Tools Used
- SQL (Data Preparation/ Querying)
- Power BI
- DAX (Time Intelligence Functions)
- Data Modeling
- Excel
