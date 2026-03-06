-- =========================================================
-- Create Cleaned GA4 Events Table
-- Extracts key ecommerce events and important attributes
-- such as session_id, traffic source, device, location,
-- and transaction revenue for funnel analysis.
-- Source: GA4 BigQuery Public Ecommerce Dataset
-- =========================================================

CREATE OR REPLACE TABLE `funnel-analysis-481322.ecommerce_analysis.cleaned_events` AS
SELECT
  event_date,
  PARSE_DATE('%Y%m%d', event_date) AS parsed_date,
  event_timestamp,
  user_pseudo_id,
  event_name,

  -- Extract session_id
  (SELECT value.int_value
   FROM UNNEST(event_params)
   WHERE key = 'ga_session_id') AS session_id,

  -- Extract page location
  (SELECT value.string_value
   FROM UNNEST(event_params)
   WHERE key = 'page_location') AS page_location,

  traffic_source.source,
  traffic_source.medium,
  traffic_source.name AS campaign,

  device.category AS device_category,
  geo.country,

  ecommerce.purchase_revenue,
  ecommerce.transaction_id

FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN (
  'session_start',
  'view_item',
  'add_to_cart',
  'begin_checkout',
  'purchase'
);
