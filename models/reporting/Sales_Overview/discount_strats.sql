SELECT
    ods.ORDERID,
    ods.DISCOUNT,
    o.ORDERDATE,
    p.PRODUCTNAME,
    p.SUPPLIER,
    ROUND(ods.REVENUE,1) AS REVENUE,
    ROUND(ods.PROFIT,1) as PROFIT
FROM
    {{ref ('stg_order_detail')}} ods
    INNER JOIN {{ref('raw_product')}} p ON ods.PRODUCTID = p.PRODUCTID
    INNER JOIN {{ref('stg_orders')}} o ON ods.ORDERID = o.ORDERID



