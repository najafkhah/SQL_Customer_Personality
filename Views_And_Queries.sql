-- Create a view to summarise total spending per customer
-- This view joins the customers and purchases tables
-- and calculates total_spent by summing all product categories.

CREATE VIEW customer_spending_summary AS
SELECT 
  c.id AS customer_id,
  c.education,
  c.marital_status,
  p.mnt_wines + p.mnt_fruits + p.mnt_meat_products +
  p.mnt_fish_products + p.mnt_sweet_products + p.mnt_gold_prods AS total_spent
FROM customers c
JOIN purchases p ON c.id = p.customer_id;


-- Retrieve the top 5 most engaged customers
-- based on the total number of purchases across web, catalog, and store.

SELECT 
  customer_id,
  num_web_purchases + num_catalog_purchases + num_store_purchases AS total_purchases
FROM engagement
ORDER BY total_purchases DESC
LIMIT 5;


-- Calculate average total spending by marital status
-- Using a CTE (Common Table Expression) to compute total spending per customer,
-- then averaging it per marital status group.

WITH total_spending AS (
  SELECT 
    c.marital_status,
    p.mnt_wines + p.mnt_fruits + p.mnt_meat_products + 
    p.mnt_fish_products + p.mnt_sweet_products + p.mnt_gold_prods AS total
  FROM customers c
  JOIN purchases p ON c.id = p.customer_id
)
SELECT 
  marital_status, 
  ROUND(AVG(total), 2) AS avg_spending
FROM total_spending
GROUP BY marital_status;