-- Customer Personality Analysis
-- This script defines domains, creates tables, and loads customer data for  analysis.
-- It includes customer demographics, purchasing behavior, campaign engagement, and metadata.

-- Define domain type for short strings
DROP DOMAIN IF EXISTS ShortString;
CREATE DOMAIN ShortString AS VARCHAR(16);

-- DROP TABLES IF EXIST

DROP TABLE IF EXISTS metadata, campaign_acceptance, engagement, purchases, customers;


-- Table to store basic customer demographics

CREATE TABLE customers (
  id INT PRIMARY KEY,
  year_birth INT,
  education ShortString,
  marital_status ShortString,
  income DECIMAL(10,2),
  kidhome INT,
  teenhome INT,
  dt_customer DATE
);


-- Table to store purchase information

CREATE TABLE purchases (
  customer_id INT,
  mnt_wines INT,
  mnt_fruits INT,
  mnt_meat_products INT,
  mnt_fish_products INT,
  mnt_sweet_products INT,
  mnt_gold_prods INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);


-- Table to store engagement information

CREATE TABLE engagement (
  customer_id INT,
  recency INT,
  num_deals_purchases INT,
  num_web_purchases INT,
  num_catalog_purchases INT,
  num_store_purchases INT,
  num_web_visits_month INT,
  complain BOOLEAN,
  response BOOLEAN,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);


-- Table to store campaign information

CREATE TABLE campaign_acceptance (
  customer_id INT,
  accepted_cmp1 BOOLEAN,
  accepted_cmp2 BOOLEAN,
  accepted_cmp3 BOOLEAN,
  accepted_cmp4 BOOLEAN,
  accepted_cmp5 BOOLEAN,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);


-- Table to store metadata information

CREATE TABLE metadata (
  customer_id INT,
  z_cost_contact INT,
  z_revenue INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

