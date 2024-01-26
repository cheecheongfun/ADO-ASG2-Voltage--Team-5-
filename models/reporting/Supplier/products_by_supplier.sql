SELECT 
    s.companyName,
    p.productID,
    s.supplierID,
    COUNT(p.productID) AS NumberOfProducts
FROM 
    {{ ref('stg_supplier') }} s
INNER JOIN 
    {{ ref('raw_product') }} p ON s.companyName = p.supplier
GROUP BY 
    s.companyName, p.productID, s.supplierID
Order BY NumberOfProducts DESC
