SELECT s.companyname, 
       s.country,
       s.supplierID,
       sum(od.quantity) AS QuantitySold,
       sum(od.revenue) AS Revenue
FROM 
    {{ref('stg_supplier')}} s
    LEFT JOIN {{ref ("raw_product")}} p
    ON p.supplier = s.companyName
    LEFT JOIN {{ref("stg_order_detail")}} od
    ON od.productID = p.productID
GROUP BY 
    s.companyname, s.supplierID, s.country
ORDER BY 
    QuantitySold DESC
