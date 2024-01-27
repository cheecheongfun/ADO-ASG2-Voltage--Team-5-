<<<<<<< HEAD
SELECT TOP 10
    c.COUNTRY as COUNTRY,
    COUNT(DISTINCT o.ORDERID) as ClosedOrder,
    ROUND(SUM(od.REVENUE),1) as REVENUE,
    ROUND(SUM(od.PROFIT),1) as PROFIT
FROM 
    {{ref ('stg_customer')}} c
    INNER JOIN {{ref ('stg_orders')}} o on c.CUSTOMERID = o.CUSTOMERID
    INNER JOIN {{ref ('stg_order_detail')}} od on od.ORDERID = o.ORDERID
GROUP BY
    c.COUNTRY
ORDER BY   
    ClosedOrder DESC




=======
>>>>>>> fc81a5fb93b3409a20c06cc99dba6fa6ff4a3aa1
