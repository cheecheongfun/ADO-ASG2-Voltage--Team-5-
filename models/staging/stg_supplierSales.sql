{{ config(materialized='view') }}

SELECT SS.companyName AS CompanyName,
       SS.supplierID AS SupplierID,
       p.productName AS ProductName,
       p.productID AS ProductID,
       SUM(quantity) AS totalSales,
       region,
       city
FROM 
    {{ref('raw_order_details')}} od
    INNER JOIN {{ref('raw_product')}} p ON od.productID = p.productID 
    INNER JOIN {{ref('raw_supplier')}} SS ON SS.supplierID = p.supplierID
GROUP BY 
    SS.companyName,SS.supplierID, p.productID, p.productName,SS.region,SS.city
ORDER BY 
    totalSales DESC

