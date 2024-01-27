{{ config (materialized='view')}}
select
o.orderID,
o.productID,
o.unitPrice,
p.unitCost,
o.quantity,
o.discount,
o.unitPrice * o.quantity as revenue,
revenue * (1 - o.discount) as netSales,
netSales - (p.unitCost * o.quantity) as profit, 
profit/netSales as profitMargin
from {{ref('raw_order_details')}} o
INNER JOIN {{ref('raw_product')}} p
ON o.productID = p.productID