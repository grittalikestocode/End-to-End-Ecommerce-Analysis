-- Create session-level aggregated table
-- Aggregates user events into session metrics
-- Includes views, carts, checkouts, purchases, and revenue

CREATE OR REPLACE TABLE `funnel-analysis-481322.ecommerce_analysis.sessions` AS
SELECT
  user_pseudo_id,
  session_id,
  MIN(parsed_date) AS session_date,
  COUNTIF(event_name = 'view_item') AS product_views,
  COUNTIF(event_name = 'add_to_cart') AS add_to_carts,
  COUNTIF(event_name = 'begin_checkout') AS checkouts,
  COUNTIF(event_name = 'purchase') AS purchases,

  SUM(purchase_revenue) AS session_revenue,

  ANY_VALUE(source) AS source,
  ANY_VALUE(medium) AS medium,
  ANY_VALUE(device_category) AS device_category,
  ANY_VALUE(country) AS country

FROM `ecommerce_analysis.cleaned_events`
WHERE session_id IS NOT NULL
GROUP BY user_pseudo_id, session_id;
