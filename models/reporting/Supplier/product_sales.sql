Select p.productName ,
	   p.productID,
	   sum(od.revenue) as Revenue,
       p.unitCost*od.quantity as CostPrice
FROM {{ref('raw_product')}} p 
INNER JOIN {{ref('stg_order_detail')}} od on p.productid = od.productid 
GROUP BY p.productName, p.productID ,CostPrice