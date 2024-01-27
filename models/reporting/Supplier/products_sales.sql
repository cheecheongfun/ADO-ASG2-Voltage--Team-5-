SELECT 
    od.orderid,
    od.productid,
    p.productName,
    p.categoryName,
    SUM(od.quantity) AS qty,
    SUM(od.Unitprice * od.quantity) AS Revenue,
    SUM(od.profit) AS Profit,
    profitMargin
FROM {{ref ('stg_order_detail')}} od 
INNER JOIN {{ ref ('raw_product')}} p ON od.productID = p.productID
GROUP BY 
    od.orderid, od.productid, p.productname,p.categoryName,profitMargin
