SELECT companyname, 
        supplierID,
       sum(TotalQtySold) AS QuantitySold
FROM 
    {{ref('stg_supplierSales')}} 
GROUP BY 
    companyname, supplierID
ORDER BY 
    QuantitySold DESC
