# End-to-End E-commerce Analytics Report

## 1. Project Overview

This project analyzes user behavior and business performance for an e-commerce platform using the **Google Analytics 4 sample dataset**. The goal is to extract actionable insights related to customer behavior, marketing channels, and revenue performance.

The analysis was performed using **Google BigQuery (SQL)** for data processing and **Looker Studio** for visualization.

### Objectives

The main objectives of this project were to:

- Analyze core business metrics (revenue, orders, users)
- Measure ecommerce conversion performance
- Identify funnel drop-offs in the purchase journey
- Evaluate marketing channel effectiveness
- Analyze customer lifetime value
- Understand customer retention patterns using cohort analysis

---

# 2. Dataset

### Source

“bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*”

This is a sample dataset of GA4 for Google Merchandise store for the period of November 2020 to  Jan 2021 available in BigQuery, containing ecommerce events such as:

- session_start
- view_item
- add_to_cart
- begin_checkout
- purchase

### Data Processing Steps

1. Raw GA4 event data was extracted.
2. Event parameters were flattened to extract key attributes.
3. Cleaned datasets were created for:
    - Sessions
    - Transactions
    - User summaries

These structured tables enabled efficient analytical queries.

---

# 3. Data Architecture

The analysis pipeline followed this structure:

```
Raw GA4 Events
      ↓
Data Cleaning (BigQuery SQL)
      ↓
Session & Transaction Tables
      ↓
KPI / Funnel / Customer Analysis
      ↓
Business Insights & Dashboard
```

---

# 4. Key Performance Indicators (KPI Analysis)

## Core Metrics

| Metric | Value |
| --- | --- |
| Total Revenue | $362,165 |
| Total Orders | 5,242 |
| Total Users | 268,023 |

The store generated **$362K in revenue from over 5,000 purchases**, while more than **268K users visited the platform**.

> This indicates strong user traffic but relatively **low purchasing activity**, suggesting opportunities to improve conversion.
> 

---

## Average Order Value (AOV)

Average Order Value measures how much revenue is generated per purchase.

Two AOV calculations were used because a **single session can contain multiple transactions**.

- **Session AOV:** $81.46
- **Transaction AOV:** $69.09

> The lower transaction-based AOV indicates that **some sessions include multiple purchases**, which increases the number of transactions relative to sessions.
> 

---

## Session Conversion Rate

<aside>
💡

Only **1.4% of sessions resulted in a purchase**, meaning approximately **1 out of 70 sessions converts**. This highlights a significant opportunity to optimize the purchasing journey.

</aside>

---

## Repeat Purchase Rate

Approximately **18% of customers return to purchase again**, while the majority make only a single purchase.

Improving retention could significantly increase revenue.

---

## Monthly Revenue Growth

| Month | Revenue | Growth |
| --- | --- | --- |
| Nov 2020 | $144,260 | — |
| Dec 2020 | $160,555 | +11% |
| Jan 2021 | $57,350 | −64% |

![image.png](image.png)

> Revenue increased during the **holiday season in December**, followed by a **sharp drop in January**, suggesting seasonal purchasing behavior.
> 

---

# 5. Funnel Analysis

The ecommerce purchase journey consists of:

```
Product View → Add to Cart → Checkout → Purchase
```

### Funnel Metrics                                                   Conversion Rates

| Stage | Sessions |
| --- | --- |
| Product Views | 77,020 |
| Add to Cart | 15,188 |
| Checkout | 11,106 |
| Purchase | 4,848 |

![Funnel Analysis](image%201.png)

Funnel Analysis

| Stage | Rate |
| --- | --- |
| View → Cart | 19.7% |
| Cart → Checkout | 73.1% |
| Checkout → Purchase | 43.7% |

![Stage trend over time](image%202.png)

Stage trend over time

<aside>
💡

**Large drop-off occurs between product views and cart additions.**

Only **19.7% of users add products to the cart**, suggesting that product pages may not sufficiently encourage purchase intent.

However, once items are added to the cart, most users proceed to checkout.

The **checkout stage shows a major drop-off**, with only **43% completing the purchase**, which may indicate friction such as:

- Shipping costs
- Checkout complexity
- Payment issues
</aside>

---

# 6. Marketing Channel Performance

Traffic sources were analyzed to determine which marketing channels generate the most revenue.

![image.png](image%203.png)

**Organic(unpaid) search via Google is the most important acquisition channel**, generating the highest traffic and revenue.

Direct traffic( means ***the traffic source is unknown)*** also performs strongly, suggesting strong **brand recognition and returning users**.

Referral sources (means the traffic is originating from another website, excluding search engines (organic) or direct traffic) generate higher **revenue per session**, indicating high-intent users.

---

# 7. Customer Lifetime Value (CLV)

Customer Lifetime Value measures the **total revenue generated by a customer during their relationship with the store**.

> The average customer contributes approximately **$89 over their lifetime**, slightly higher than the average order value. This suggests that most customers **make only one purchase**, while a smaller portion of users generate additional revenue through repeat purchases.
> 

---

# 8. CLV by Marketing Channel

| Source | Medium | Avg CLV |
| --- | --- | --- |
| <Other> | Organic | $157.36 |
| <Data Deleted> | <Data Deleted> | $132.86 |
| Google Merch Store | Referral | $127.65 |
| Direct | None | $123.28 |
| Google | Organic | $114.47 |
| Google | CPC | $77.23 |

Organic and referral channels produce **higher-value customers**, while paid search users generate lower lifetime value.

---

# 9. Cohort Retention Analysis

Customer cohorts were analyzed based on their **first purchase month**.

| Month Since First Purchase | Active Users | Retention |
| --- | --- | --- |
| November 2020 | 1,482 | - |
| December 2020 | 391 | 26% |
| January 2021 | 105 | 7% |

> Retention drops significantly after the first month. Only **~26% return in month one**, and **~7% remain active by month two**. This indicates opportunities to improve **customer retention strategies**.
> 

# 10. RFM Analysis

RFM analysis segments customers based on **Recency (R), Frequency (F), and Monetary value (M)** to understand purchasing behavior and identify high-value users.

![RFM segmentation](image%204.png)

RFM segmentation

<aside>
💡

Focusing on **retaining Champions, converting New Customers, and re-engaging At Risk customers** can significantly improve customer lifetime value and long-term revenue.

</aside>

---

# 11. Business Recommendations

Based on the analysis, the following actions could improve ecommerce performance:

### Improve Product Page Engagement

Enhance product descriptions, reviews, and images to increase add-to-cart rates.

### Reduce Checkout Friction

Simplify checkout steps and improve payment options to reduce abandonment.

### Invest in High-Performing Channels

Organic search and referral traffic generate high-value customers.

### Improve Customer Retention

Introduce loyalty programs, targeted promotions, and email campaigns to encourage repeat purchases.

---

# 12. Tools Used

- **Google BigQuery** — SQL data processing
- **SQL** — Data transformation and analysis
- **Looker Studio**  — Dashboard visualization
- **GitHub** — Project documentation and version control
