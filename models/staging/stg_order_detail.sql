{{ config (materialized='view')}}
select
o.orderID,
o.productID,
o.unitPrice,
p.unitCost,
o.quantity,
o.discount,
ROUND(o.unitPrice * o.quantity,1) as revenue,
ROUND(revenue * (1 - o.discount),1) as netSales,
ROUND(netSales - (p.unitCost * o.quantity),1) as profit, 
ROUND(profit/netSales * 100,1) as profitMargin
from {{ref('raw_order_details')}} o
INNER JOIN {{ref('raw_product')}} p
ON o.productID = p.productID