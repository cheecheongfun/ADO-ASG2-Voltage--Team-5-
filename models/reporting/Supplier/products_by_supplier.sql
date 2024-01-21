SELECT 
    s.companyName,
    COUNT(p.productID) AS NumberOfProducts
FROM 
    {{ ref('raw_supplier') }} s
INNER JOIN 
    {{ ref('raw_product') }} p ON s.supplierID = p.supplierID
GROUP BY 
    s.companyName
Order BY NumberOfProducts DESC
