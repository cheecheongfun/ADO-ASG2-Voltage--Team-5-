{{ config(materialized='view') }}

SELECT s.companyName AS CompanyName,
       s.supplierID AS SupplierID,
       p.productName AS ProductName,
       p.productID AS ProductID,
       SUM(quantity) AS TotalQtySold,
       SUM(od.unitPrice * quantity) as Revenue
FROM 
    {{ref('raw_order_details')}} od
    INNER JOIN {{ref('raw_product')}} p ON od.productID = p.productID 
    INNER JOIN {{ref('raw_supplier')}} s ON s.supplierID = p.supplierID
GROUP BY 
    s.companyName,s.supplierID, p.productID, p.productName
ORDER BY 
    Revenue DESC
