SELECT 
    orderid,
    SUM(quantity) AS qty,
    SUM(Unitprice * quantity) AS Revenue 
FROM 
    {{ ref ('raw_order_details')}}
GROUP BY 
    orderid
