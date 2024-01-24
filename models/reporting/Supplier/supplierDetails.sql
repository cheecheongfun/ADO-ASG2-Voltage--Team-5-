SELECT companyname, 
       country,
       supplierID,
       sum(TotalQtySold) AS QuantitySold,
       sum(Revenue) AS netSales
FROM 
    {{ref('stg_supplier')}} 
GROUP BY 
    companyname, supplierID, country
ORDER BY 
    QuantitySold DESC
