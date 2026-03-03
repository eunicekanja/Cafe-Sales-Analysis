SELECT * 
from dirty_cafe_sales;

#CREATE WORKING TABLE
CREATE TABLE working_data
Select *
FROM dirty_cafe_sales;

Select *
FROM working_data;
DESCRIBE working_data;
#Rename columns to correct format
ALTER TABLE working_data
RENAME COLUMN `Transaction ID` TO transaction_id;
ALTER TABLE working_data
RENAME COLUMN `Price Per Unit` TO price_per_unit;
ALTER TABLE working_data
RENAME COLUMN `Total Spent` TO total_spent;
ALTER TABLE working_data
RENAME COLUMN `Payment Method` TO payment_method;
ALTER TABLE working_data
RENAME COLUMN `Transaction Date` TO transaction_date;

#check for duplicates with window function and subquery and again with CTE
Select*
FROM(
Select transaction_id,ROW_NUMBER() over(PARTITION BY transaction_id,
Item,
Quantity,
price_per_unit,
total_spent,
payment_method,
Location,
transaction_date) as Row_num
FROM working_data
)t
where row_num=2;

With dupes as(
Select transaction_id,ROW_NUMBER() over(PARTITION BY transaction_id,
Item,
Quantity,
price_per_unit,
total_spent,
payment_method,
Location,
transaction_date) as Row_num
FROM working_data
)
Select *
FROM dupes
WHERE row_num=2;
#check data formats/validate data

#handle null in item by deleting unusable rows & missing data in total sepnt is updated by caluculating price and qty
# & unusable date
SELECT* FROM working_data;
DESCRIBE 
SELECT DISTINCT ITEM
FROM working_data;

#handle null/error/uknown/blank in item
DELETE working_data
FROM working_data
WHERE item is null or trim(item) in('UNKNOWN', 'ERROR' , '');

#handle blank/error in total spent
SELECT*
FROM working_data
WHERE total_spent is null or trim(total_spent) in('UNKNOWN', 'ERROR' , '');

UPDATE working_data
set total_spent= quantity*price_per_unit
where total_spent is null or trim(total_spent) in('UNKNOWN', 'ERROR' , '');

#Drop payment method column
ALTER TABLE working_data
DROP COLUMN payment_method;

#changing date to correct format and cleaning erronous rows
SELECT*
FROM working_data
WHERE transaction_date is null or trim(transaction_date) in('UNKNOWN', 'ERROR' , '') and location is null or trim(location) in('UNKNOWN', 'ERROR' , '') ;

DELETE working_data
FROM working_data
WHERE  transaction_date is null or trim(transaction_date) in('UNKNOWN', 'ERROR' , '');

DESCRIBE working_data;

ALTER TABLE working_data
MODIFY COLUMN transaction_date DATE;

SELECT *
FROM working_data;

#aggregations
SELECT sum(total_spent)
FROM working_data;
SELECT item, sum(total_spent) as 'Total_revenue'
From working_data
GROUP BY item
ORDER BY 2 DESC;