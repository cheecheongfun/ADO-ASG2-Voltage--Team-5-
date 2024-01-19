{{ config (materialized='view')}}
select
orderID,
productID,
unitPrice,
quantity,
discount,
unitPrice * quantity as revenue,
ROUND((unitPrice * quantity) * (1 - discount),1) as netSales
from {{ref('raw_order_details')}}