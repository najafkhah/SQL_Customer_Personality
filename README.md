#  Customer Personality Analysis – SQL Project

## Overview

This project contains SQL scripts for exploring and analysing a customer personality and marketing dataset. 

The project demonstrates relational database design, data normalisation, and analytical SQL queries involving joins, aggregations, and views.

---

## Files

- `schema.sql` – Defines the database structure (tables, domain, and relationships).
- `queries.sql` – Contains exploratory and analytical SQL queries and views.
- `load_data.sql` – Scripts for loading data into the defined tables.
- `data files` – Include:
  - `customers.csv`
  - `purchases.csv`
  - `engagement.csv`
  - `campaign_acceptance.csv`
  - `metadata.csv`

---

## Database Structure

The schema consists of the following tables:

### `customers`
Stores demographic information such as


### `purchases`
Captures total spending on various product categories


### `engagement`
Tracks customer interaction and behaviours


### `campaign_acceptance`
Indicates whether a customer accepted any of five marketing campaigns.

### `metadata`
Stores internal marketing metrics


---

## Relationships

Each customer:
- Has one row in `customers`
- have one corresponding row in each of the other four tables (`purchases`, `engagement`, `campaign_acceptance`, and `metadata`)

All secondary tables use `customer_id` as a foreign key.




