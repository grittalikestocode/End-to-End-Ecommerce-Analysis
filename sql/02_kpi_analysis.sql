-- Core KPIs
-- Calculates overall revenue, orders, and user count
SELECT
  (SELECT SUM(revenue) FROM ecommerce_analysis.transactions) AS total_revenue,

  (SELECT COUNT(*) FROM ecommerce_analysis.transactions) AS total_orders,

  (SELECT COUNT(DISTINCT user_pseudo_id)
   FROM ecommerce_analysis.sessions) AS total_users;

-- Average Order Value (AOV) using session revenue
-- AOV = Total Revenue / Number of Purchasing Sessions

SELECT
  SUM(session_revenue) AS total_revenue,
  COUNTIF(session_revenue > 0) AS total_orders,
  SAFE_DIVIDE(
    SUM(session_revenue),
    COUNTIF(session_revenue > 0)
  ) AS avg_order_value
FROM `ecommerce_analysis.sessions`;

-- Average Order Value (AOV) using transaction table
-- AOV = Total Revenue / Total Transactions
SELECT
  COUNT(*) AS total_transactions,
  SUM(revenue) AS total_revenue,
  SAFE_DIVIDE(SUM(revenue), COUNT(*)) AS avg_order_value
FROM ecommerce_analysis.transactions;

-- Session Conversion Rate
-- Conversion Rate = Purchasing Sessions / Total Sessions

SELECT
  COUNT(DISTINCT session_id) AS total_sessions,
  COUNTIF(purchases > 0) AS converting_sessions,
  SAFE_DIVIDE(
    COUNTIF(purchases > 0),
    COUNT(DISTINCT session_id)
  ) AS conversion_rate
FROM `ecommerce_analysis.sessions`;

-- Repeat Purchase Rate
-- Percentage of customers who made more than one purchase
WITH customer_orders AS (
  SELECT
    user_pseudo_id,
    COUNT(*) AS total_orders
  FROM ecommerce_analysis.transactions
  GROUP BY user_pseudo_id
)

SELECT
  COUNTIF(total_orders > 1) AS repeat_customers,
  COUNT(*) AS total_customers,
  SAFE_DIVIDE(
    COUNTIF(total_orders > 1),
    COUNT(*)
  ) AS repeat_purchase_rate
FROM customer_orders;

-- Monthly Revenue Growth
-- Calculates month-over-month revenue growth
WITH monthly_data AS (
  SELECT
    DATE_TRUNC(purchase_date, MONTH) AS month,
    SUM(revenue) AS monthly_revenue
  FROM ecommerce_analysis.transactions
  GROUP BY month
),

monthly_with_lag AS (
  SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY month) AS previous_month_revenue
  FROM monthly_data
)

SELECT
  month,
  monthly_revenue,
  previous_month_revenue,
  SAFE_DIVIDE(
    monthly_revenue - previous_month_revenue,
    previous_month_revenue
  ) AS monthly_growth_rate
FROM monthly_with_lag
ORDER BY month;
