{{
    config(
        materialized='table',
        schema='bronze'
    )
}}

-- サンプルデータを生成するためのクエリ
-- 実際の環境では外部システムからのデータを取り込むクエリに置き換えてください
SELECT
    seq4() as order_id,
    uniform(1, 1000, random()) as customer_id,
    dateadd('day', -uniform(1, 365, random()), current_date()) as order_date,
    round(uniform(10, 1000, random()), 2) as total_amount
FROM table(generator(rowcount => 1000)) 