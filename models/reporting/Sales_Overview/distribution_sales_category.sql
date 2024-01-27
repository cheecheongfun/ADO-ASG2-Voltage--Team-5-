SELECT 
    p.CATEGORYNAME AS CATEGORYNAME,
    COUNT(od.ORDERID) AS ORDERCOUNT,
    SUM(od.QUANTITY) AS QUANTITY,
    ROUND(SUM(od.REVENUE),1) as REVENUE,
    ROUND(SUM(od.PROFIT),1) as PROFIT
FROM
    {{ref('raw_product')}} p
    INNER JOIN {{ref('stg_order_detail')}} od ON p.PRODUCTID = od.PRODUCTID
GROUP BY
    p.CATEGORYNAME
 