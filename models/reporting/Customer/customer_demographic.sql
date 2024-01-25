SELECT
  c.customerID as customerID, 
  c.companyName as companyName,
  c.contactTitle as contactTitle, 
  cat.categoryName as categoryName, 
  ROUND(SUM(od.netSales), 1) as TotalSales
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('stg_orders')}} o ON c.customerID = o.customerID
  INNER JOIN {{ref('stg_order_detail')}} od ON od.orderID = o.orderID
  INNER JOIN {{ref('raw_product')}} p ON p.productID = od.productID
  INNER JOIN {{ref('raw_category')}} cat ON cat.categoryID = p.categoryID
GROUP BY
    c.customerID, c.companyName, c.contactTitle, cat.categoryName