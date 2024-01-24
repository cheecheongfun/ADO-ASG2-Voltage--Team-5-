Select p.productName ,
	   p.productID,
	   od.netsales,
       od.quantity AS QuantitySold
FROM {{ref('raw_product')}} p 
INNER JOIN {{ref('stg_order_detail')}} od on p.productid = od.productid 
