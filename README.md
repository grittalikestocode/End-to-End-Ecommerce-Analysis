# End-to-End-Ecommerce-Analysis Project (SQL + BigQuery)

## Project Overview

This project performs an **end-to-end analysis of an e-commerce dataset** using **Google BigQuery and SQL** to understand customer behavior, marketing performance, and revenue trends.

The goal of the project is to extract **actionable business insights** from user activity data and identify opportunities to improve conversion, retention, and overall revenue performance.

The dataset used is the **Google Analytics 4 (GA4) Google Merchandise Store dataset** available in BigQuery.

---

## Tools & Technologies

* **SQL**
* **Google BigQuery**
* **Google Analytics 4 Sample Dataset**
* **Looker Studio / BI Dashboard**
* **GitHub**

---

## Project Workflow

Raw GA4 Event Data
↓
Data Cleaning & Transformation (SQL)
↓
Session & Transaction Tables
↓
KPI Analysis
↓
Funnel Analysis
↓
Customer Analytics (CLV, Cohorts, RFM)
↓
Dashboard Visualization & Insights

---

## Data Preparation

Raw GA4 event data was processed in BigQuery to create structured analytical tables.

Key tables created:

* **cleaned_events** – cleaned GA4 event data
* **sessions** – session-level user activity
* **transactions** – purchase-level transaction data
* **user_summary** – aggregated customer metrics
* **user_first_purchase** – first purchase dates for cohort analysis

---

## Key Analyses

### KPI Analysis

Core business metrics were calculated:

* Total Revenue: **$362,165**
* Total Orders: **5,242**
* Total Users: **268,023**
* Average Order Value: **$69–$81**
* Conversion Rate: **1.4%**
* Repeat Purchase Rate: **17.7%**

---

### Funnel Analysis

Customer journey stages:

Product View → Add to Cart → Checkout → Purchase

| Stage         | Sessions |
| ------------- | -------- |
| Product Views | 77,020   |
| Add to Cart   | 15,188   |
| Checkout      | 11,106   |
| Purchases     | 4,848    |

Key insight:
The largest drop-off occurs between **product views and cart additions**, indicating an opportunity to improve product page engagement.

---

### Marketing Channel Analysis

Top revenue sources:

| Source         | Revenue |
| -------------- | ------- |
| Google Organic | $95,775 |
| Direct         | $79,650 |
| Referral       | $46,521 |

Organic search generates the **largest share of traffic and revenue**, highlighting the importance of SEO.

---

### Customer Analytics

Customer value and retention were analyzed using several techniques.

**Customer Lifetime Value (CLV)**
Average CLV: **$89**

**Cohort Analysis**
Customer retention declines significantly after the first purchase.

**RFM Segmentation**

| Segment         | Customers |
| --------------- | --------- |
| Others          | 1,634     |
| Loyal Customers | 1,130     |
| At Risk         | 675       |
| New Customers   | 328       |
| Champions       | 299       |

This segmentation helps identify **high-value customers and churn risk segments**.

---

## Key Insights

* The store generated **$362K revenue** from over **5K purchases**
* Conversion rate is **1.4%**, indicating room for funnel optimization
* **Organic search is the strongest acquisition channel**
* Most customers make **only one purchase**
* Retention drops significantly after the first month

---

## Business Recommendations

* Improve product pages to increase **add-to-cart rate**
* Simplify the **checkout process** to reduce abandonment
* Invest more in **organic search and referral channels**
* Implement **customer retention strategies** such as loyalty programs and targeted promotions

---

## Repository Structure

```
End-to-End-Ecommerce-Analysis
│
├── sql
│   ├── 01_data_preparation
        ├── create_cleaned_events.sql
        ├── create_sessions_table.sql
        ├── create_transactions_table.sql
        └── create_user_summary.sql
│   ├── 02_kpi_analysis.sql
│   ├── 03_funnel_analysis.sql
│   └── 04_customer_analysis.sql
│
├── analysis
│   └── ecommerce_analysis_report.md
│
├── dashboards
│   └── dashboard_screenshots
│
└── README.md
```

---

## Author

**Gritta Joshy**

Master’s in Data Science
Data Analytics & Machine Learning
