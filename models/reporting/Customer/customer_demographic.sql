SELECT
  c.customerID as customerID, 
  c.companyName as companyName,
  c.contactTitle as contactTitle, 
  p.categoryName as categoryName, 
  ROUND(SUM(od.netSales), 1) as TotalSales,
  ROUND(SUM(od.profit), 1) as Profit,
  ROUND(AVG(od.profitMargin)) as ProfitMargin
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('stg_orders')}} o ON c.customerID = o.customerID
  INNER JOIN {{ref('stg_order_detail')}} od ON od.orderID = o.orderID
  INNER JOIN {{ref('raw_product')}} p ON p.productID = od.productID
GROUP BY
    c.customerID, c.companyName, c.contactTitle, p.categoryName