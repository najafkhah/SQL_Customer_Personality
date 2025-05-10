======================
-- Domain definitions

DROP DOMAIN IF EXISTS ShortString, MediumString, LongString;

CREATE DOMAIN ShortString AS VARCHAR(16);
CREATE DOMAIN MediumString AS VARCHAR(64);
CREATE DOMAIN LongString AS VARCHAR(256);

======================
-- DROP TABLES IF EXIST

DROP TABLE IF EXISTS metadata, campaign_acceptance, engagement, purchases, customers;

======================
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

======================
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

======================
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

======================
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

======================
-- Table to store metadata information

CREATE TABLE metadata (
  customer_id INT,
  z_cost_contact INT,
  z_revenue INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

======================
-- LOAD DATA FROM CSV FILES

COPY customers(id, year_birth, education, marital_status, income, kidhome, teenhome, dt_customer)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/Customer.csv'
DELIMITER ','
CSV HEADER;

COPY purchases(customer_id, mnt_wines, mnt_fruits, mnt_meat_products, mnt_fish_products, mnt_sweet_products, mnt_gold_prods)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/customer-segmentation-sql/data/Purchases.csv'
DELIMITER ','
CSV HEADER;

COPY engagement(customer_id, recency, num_deals_purchases, num_web_purchases, num_catalog_purchases, num_store_purchases, num_web_visits_month, complain, response)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/customer-segmentation-sql/data/Engagement.csv'
DELIMITER ','
CSV HEADER;

COPY campaign_acceptance(customer_id, accepted_cmp1, accepted_cmp2, accepted_cmp3, accepted_cmp4, accepted_cmp5)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/customer-segmentation-sql/data/Campaign Acceptance.csv'
DELIMITER ','
CSV HEADER;

COPY metadata(customer_id, z_cost_contact, z_revenue)
FROM 'C:/Users/n10652388/OneDrive - Queensland University of Technology/CV/Work/Github/customer-segmentation-sql/data/metadata.csv'
DELIMITER ','
CSV HEADER;

======================
--  SAMPLE INSERTS

INSERT INTO customers 
VALUES
  (5524, 1957, 'Graduation', 'Married', 58138, 0, 0, TO_DATE('2012-09-04', 'YYYY-MM-DD')),
  (2174, 1958, 'Graduation', 'Single', 46344, 1, 1, TO_DATE('2014-03-08', 'YYYY-MM-DD'));

INSERT INTO purchases 
VALUES
  (5524, 635, 88, 546, 172, 87, 88),
  (2174, 11, 1, 6, 2, 1, 6);

INSERT INTO engagement 
VALUES
  (5524, 58, 3, 8, 10, 4, 7, TRUE, TRUE),
  (2174, 38, 2, 1, 1, 2, 5, FALSE, FALSE),
  (4141, 26, 1, 8, 2, 10, 4, FALSE, FALSE);

INSERT INTO metadata
VALUES
  (5524, 3, 11),
  (2174, 4, 11),
  (4141, 3, 11);
  
INSERT INTO campaign_acceptance 
VALUES
  (5524, FALSE, FALSE, TRUE, FALSE, FALSE),
  (2174, FALSE, FALSE, FALSE, TRUE, FALSE);

  
