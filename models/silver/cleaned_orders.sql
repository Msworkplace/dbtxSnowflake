{{
    config(
        materialized='table',
        schema='silver'
    )
}}

WITH source_data AS (
    SELECT * FROM {{ ref('raw_orders') }}
),

cleaned AS (
    SELECT
        order_id,
        customer_id,
        -- 日付のクレンジング（未来の日付は現在日付に置換）
        CASE
            WHEN order_date > current_date() THEN current_date()
            ELSE order_date
        END as order_date,
        -- 金額のクレンジング（負の値は0に置換）
        CASE
            WHEN total_amount < 0 THEN 0
            ELSE total_amount
        END as total_amount
    FROM source_data
    WHERE order_id IS NOT NULL  -- 無効なオーダーを除外
)

SELECT * FROM cleaned 