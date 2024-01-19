SELECT companyName,
       productName ,
       productID,
       totalSales As TotalQtySold
FROM 
    {{ref('stg_supplierSales')}} 
