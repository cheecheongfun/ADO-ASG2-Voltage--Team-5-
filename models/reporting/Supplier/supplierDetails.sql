SELECT companyname, 
       supplierID,
       sum(TotalQtySold) AS QuantitySold,
       sum(Revenue) AS netSales
FROM 
    {{ref('stg_supplier')}} 
GROUP BY 
    companyname, supplierID
ORDER BY 
    QuantitySold DESC
