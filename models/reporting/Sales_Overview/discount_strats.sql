SELECT
    ods.ORDERID,
    ods.DISCOUNT,
    p.PRODUCTNAME,
    p.SUPPLIER,
    ods.REVENUE AS REVENUE,
    ods.PROFIT as PROFIT
FROM
    {{ref ('stg_order_detail')}} ods
    INNER JOIN {{ref('raw_product')}} p ON ods.PRODUCTID = p.PRODUCTID



