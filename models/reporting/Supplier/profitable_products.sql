SELECT 
    od.orderid,
    od.productid,
    p.productName,
    p.categoryName,
    SUM(od.quantity) AS qty,
    SUM(od.Unitprice * od.quantity) AS Revenue,
    SUM(od.profit) AS Profit,
    discontinued,
    profitMargin
FROM {{ref ('stg_order_detail')}} od 
INNER JOIN {{ ref ('raw_product')}} p ON od.productID = p.productID
WHERE 
    p.discontinued != 'Yes'
GROUP BY 
    od.orderid, od.productid, p.productname,P.DISCONTINUED,p.categoryName,profitMargin
HAVING 
    SUM(od.profit) >= 0.5 * SUM(Revenue)