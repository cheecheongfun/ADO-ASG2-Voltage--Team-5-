SELECT 
    orderid,
    SUM(quantity) AS qty,
    SUM(Unitprice * quantity) AS netSales 
FROM 
    {{ ref ('raw_order_details')}}
GROUP BY 
    orderid
