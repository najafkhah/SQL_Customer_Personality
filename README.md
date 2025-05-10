-- Domain definitions
CREATE DOMAIN ShortString AS VARCHAR(16);
CREATE DOMAIN MediumString AS VARCHAR(64);
CREATE DOMAIN LongString AS VARCHAR(256);

-- Table to store basic customer demographics
CREATE TABLE customers (
  id INT PRIMARY KEY,
  year_birth INT,
  education VARCHAR(50),
  marital_status VARCHAR(50),
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

COPY customers(id, year_birth, education, marital_status, income, kidhome, teenhome, dt_customer)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/customer-segmentation-sql/data/marketing_data.csv'
DELIMITER ','
CSV HEADER;

