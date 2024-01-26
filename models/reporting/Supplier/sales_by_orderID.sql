SELECT 
    -- changed raw_order_detail to stg, can add profit and profit margin all that
    orderid,
    SUM(quantity) AS qty,
    SUM(Unitprice * quantity) AS Revenue 
FROM 
    {{ ref ('stg_order_detail')}}
GROUP BY 
    orderid
