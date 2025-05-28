{{
    config(
        materialized='table',
        schema='gold'
    )
}}

WITH source_data AS (
    SELECT * FROM {{ ref('cleaned_orders') }}
)

SELECT
    order_date,
    COUNT(*) as total_orders,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as avg_order_value
FROM source_data
GROUP BY order_date
ORDER BY order_date 