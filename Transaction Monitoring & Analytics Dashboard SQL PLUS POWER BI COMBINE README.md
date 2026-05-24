# Transaction Monitoring & Analytics Dashboard

## Project Overview

This project focuses on analyzing financial transaction behavior using SQL and Power BI.

The dashboard was built to help stakeholders monitor transaction activity, identify unusual behavior, analyze customer transaction patterns, and improve operational visibility across financial records.

The dataset contains:

* 37,417 financial transactions
* 8,856 customer accounts
* 93.46M total transaction value
* 9 years of historical transaction activity

---

# Business Problem

The organization was processing thousands of financial transactions daily, but there was no centralized way to quickly identify which transactions required attention.

Teams were manually reviewing large amounts of routine activity, making it difficult to:

* Detect high-value transactions quickly
* Identify repetitive account behavior
* Monitor long-term transaction trends
* Investigate hidden transaction relationships
* Prioritize operational review efforts

The goal of this project was to reduce unnecessary investigation effort and improve transaction monitoring visibility through interactive analytics.

---

# Stakeholders

## Finance Team

* Monitor transaction movement and account activity

## Risk & Fraud Team

* Identify unusual transaction behavior
* Investigate high-value transactions

## Operations Team

* Track transaction trends and operational activity

## Management Team

* Improve visibility into customer behavior and transaction performance

---

# Tools & Technologies

* SQL
* Power BI
* DAX
* Excel

---

# Data Cleaning & Preparation

To ensure reliable analysis, the dataset was cleaned and validated using SQL.

### Cleaning Steps

* Verified unique TransactionIDs
* Checked missing values
* Removed duplicate behavior
* Standardized timestamps
* Standardized transaction categories
* Validated transaction consistency

### Results

* 37,417 unique transactions verified
* Cleaned inconsistent transaction records
* Identified 1,000 high-frequency accounts (11.3%)

---

# Exploratory Data Analysis (EDA)

## Transaction Segmentation

| Segment      | Transactions | Percentage |
| ------------ | ------------ | ---------- |
| Medium Value | 22,529       | 60.21%     |
| High Value   | 7,440        | 19.88%     |
| Low Value    | 7,448        | 19.91%     |

---

## Transaction Distribution by Type

| Transaction Type | Contribution |
| ---------------- | ------------ |
| Transfer         | 25.22%       |
| Payment          | 25.02%       |
| Withdrawal       | 24.99%       |
| Deposit          | 24.77%       |

The transaction ecosystem remained highly balanced across all categories.

---

# Statistical Insights

One major insight changed the direction of the project:

* 29,908 transactions (79.93%) represented completely normal activity
* Only 7,509 transactions (20.06%) required closer monitoring

Additional findings:

* 193,449 transaction relationships discovered through JOIN analysis
* Average transaction linkage: 5.17 related records
* Only 69 transactions (0.18%) showed extreme low-value anomaly behavior

---

# Dashboard Features

The Power BI dashboard includes:

* KPI Cards
* Transaction Trend Analysis
* Account Activity Monitoring
* High-Value Transaction Analysis
* Transaction Segmentation
* Interactive Filters & Slicers
* Relationship Analysis

---

# Dashboard KPIs

| KPI                     | Value  |
| ----------------------- | ------ |
| Total Transactions      | 37,417 |
| Total Accounts          | 8,856  |
| Total Transaction Value | 93.46M |
| Average Balance         | 50.01K |
| High-Value Transactions | 7,440  |

---

# Business Impact

The dashboard improved operational visibility and reduced unnecessary review effort.

### Impact Achieved

* Reduced investigation focus from 37,417 records to 7,509 anomaly-focused transactions
* Reduced unnecessary review workload by approximately 80%
* Improved monitoring visibility across 8,856 customer accounts
* Centralized 9 years of transaction analysis into one dashboard
* Improved visibility into high-frequency and high-value activity

---

# Recommendations

1. Prioritize monitoring of the 20.06% anomalous transactions

2. Apply stronger controls to high-frequency accounts

3. Implement automated alerts for high-value transactions

4. Use transaction relationship mappings for fraud tracing

5. Expand toward predictive transaction monitoring

---

# Final Business Story

At first, the transaction system appeared stable because most activity looked routine.

But deeper analysis showed that important operational signals were hidden inside thousands of normal records.

The real business problem was not data availability.

The real problem was visibility.

By segmenting transaction behavior and identifying unusual patterns, the project helped reduce operational noise and improve focus on transactions that actually required attention.

The result was a more focused, centralized, and decision-friendly transaction monitoring process.

---


## Skills Demonstrated

* SQL Querying
* Data Cleaning
* Exploratory Data Analysis
* Statistical Analysis
* Dashboard Development
* Business Intelligence
* Data Storytelling

