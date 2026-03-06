-- Create user-level aggregated metrics
-- Includes total sessions, transactions, and revenue per user

CREATE OR REPLACE TABLE ecommerce_analysis.user_summary AS
WITH user_sessions AS (
  SELECT
    user_pseudo_id,
    COUNT(DISTINCT session_id) AS total_sessions,
    MAX(session_date) AS last_session_date
  FROM ecommerce_analysis.sessions
  GROUP BY user_pseudo_id
),

user_transactions AS (
  SELECT
    user_pseudo_id,
    COUNT(*) AS total_transactions,
    SUM(revenue) AS total_revenue,
    MAX(purchase_date) AS last_purchase_date
  FROM ecommerce_analysis.transactions
  GROUP BY user_pseudo_id
)

SELECT
  s.user_pseudo_id,
  s.total_sessions,
  IFNULL(t.total_transactions, 0) AS total_transactions,
  IFNULL(t.total_revenue, 0) AS total_revenue,
  s.last_session_date,
  t.last_purchase_date
FROM user_sessions s
LEFT JOIN user_transactions t
  ON s.user_pseudo_id = t.user_pseudo_id;
