-- Create Transactions Table
-- Each row represents a purchase event extracted from GA4 events
-- Includes user, session, revenue, traffic source, device, and location

CREATE OR REPLACE TABLE ecommerce_analysis.transactions AS
SELECT
  CONCAT(user_pseudo_id, '_', CAST(event_timestamp AS STRING)) AS transaction_key,
  user_pseudo_id,

  (SELECT value.int_value
   FROM UNNEST(event_params)
   WHERE key = 'ga_session_id') AS session_id,

  PARSE_DATE('%Y%m%d', event_date) AS purchase_date,
  ecommerce.purchase_revenue AS revenue,
  traffic_source.source,
  traffic_source.medium,
  device.category AS device_category,
  geo.country
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
  AND ecommerce.purchase_revenue IS NOT NULL;

-- Join Sessions with Transactions
-- Used to analyze revenue by session attributes
SELECT
  s.session_id,
  s.source,
  s.device_category,
  t.revenue
FROM ecommerce_analysis.sessions s
LEFT JOIN ecommerce_analysis.transactions t
  ON s.session_id = t.session_id
  AND s.user_pseudo_id = t.user_pseudo_id;
