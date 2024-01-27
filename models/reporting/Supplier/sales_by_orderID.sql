SELECT 
    -- changed raw_order_detail to stg, can add profit and profit margin all that
    orderid,
    SUM(quantity) AS qty,
    SUM(Unitprice * quantity) AS Revenue ,
    SUM(profit) as Profit,
    profitMargin
FROM 
    {{ ref ('stg_order_detail')}}
GROUP BY 
    orderid,profitMargin