select c.categoryID, 
    categoryName,
    p.ProductID, 
    productName,
    SUM(od.unitPrice* od.quantity) AS revenue ,
    Count(od.Quantity) AS AmtSold
From {{ ref ('raw_category')}} c 
INNER JOIN {{ ref ('raw_product')}} p on c.categoryId = p.categoryId
INNER JOIN {{ ref('raw_order_details')}} od on p.productId = od.productId
Group By c.CategoryID, p.ProductID , categoryName , productName 
