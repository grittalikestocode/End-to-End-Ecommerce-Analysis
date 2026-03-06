-- This file analyzes customer behavior and long-term value.

--Customer Lifetime Value (CLV) Analysis

--  CLV per user
SELECT
  user_pseudo_id,
  total_transactions,
  total_revenue AS historical_clv
FROM ecommerce_analysis.user_summary
ORDER BY historical_clv DESC;

-- Average Customer Lifetime Value
SELECT
  AVG(total_revenue) AS avg_customer_lifetime_value
FROM ecommerce_analysis.user_summary
WHERE total_transactions > 0;

-- CLV by Marketing Channel
SELECT
  t.source,
  t.medium,
  AVG(u.total_revenue) AS avg_clv,
  COUNT(DISTINCT u.user_pseudo_id) AS customers
FROM ecommerce_analysis.user_summary u
JOIN ecommerce_analysis.transactions t
  ON u.user_pseudo_id = t.user_pseudo_id
GROUP BY t.source, t.medium
ORDER BY avg_clv DESC;

-- CLV by Country
SELECT
  t.country,
  AVG(u.total_revenue) AS avg_clv,
  COUNT(DISTINCT u.user_pseudo_id) AS customers
FROM ecommerce_analysis.user_summary u
JOIN ecommerce_analysis.transactions t
  ON u.user_pseudo_id = t.user_pseudo_id
GROUP BY t.country
ORDER BY avg_clv DESC;

--Cohort Analysis
-- Tracks customer retention by first purchase month
SELECT
  DATE_TRUNC(first_purchase_date, MONTH) AS cohort_month,
  DATE_DIFF(session_date, first_purchase_date, MONTH) AS month_number,
  COUNT(DISTINCT s.user_pseudo_id) AS active_users
FROM `ecommerce_analysis.sessions` s
JOIN`ecommerce_analysis.user_first_purchase` u
  ON s.user_pseudo_id = u.user_pseudo_id
WHERE session_date >= first_purchase_date   
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;


