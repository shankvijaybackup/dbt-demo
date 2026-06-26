{{ config(materialized='table') }}

select
    user_id,
    count(order_id) as total_orders,
    round(sum(sale_price), 2) as total_spend
from `bigquery-public-data.thelook_ecommerce.order_items`
where status = 'Complete'
group by user_id