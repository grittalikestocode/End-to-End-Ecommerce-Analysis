--Funnel Analysis
WITH funnel AS (
  SELECT
    COUNTIF(product_views > 0) AS product_view_sessions,
    COUNTIF(add_to_carts > 0) AS cart_sessions,
    COUNTIF(checkouts > 0) AS checkout_sessions,
    COUNTIF(purchases > 0) AS purchase_sessions
  FROM ecommerce_analysis.sessions
)

SELECT *,
  SAFE_DIVIDE(cart_sessions, product_view_sessions) AS view_to_cart_rate,
  SAFE_DIVIDE(checkout_sessions, cart_sessions) AS cart_to_checkout_rate,
  SAFE_DIVIDE(purchase_sessions, checkout_sessions) AS checkout_to_purchase_rate
FROM funnel;

--Channel Performance

SELECT
  source,
  medium,

  COUNT(DISTINCT session_id) AS sessions,
  COUNTIF(purchases > 0) AS conversions,
  SUM(session_revenue) AS revenue,

  SAFE_DIVIDE(COUNTIF(purchases > 0),
              COUNT(DISTINCT session_id)) AS conversion_rate,

  SAFE_DIVIDE(SUM(session_revenue),
              COUNT(DISTINCT session_id)) AS revenue_per_session

FROM ecommerce_analysis.sessions
GROUP BY source, medium
ORDER BY revenue DESC;

