SELECT companyname, 
       sum(TotalQtySold) AS QuantitySold
FROM 
    {{ref('stg_supplierSales')}} 
GROUP BY 
    companyname
ORDER BY 
    QuantitySold DESC
