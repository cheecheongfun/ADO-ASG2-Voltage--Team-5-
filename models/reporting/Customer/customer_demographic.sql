SELECT
  c.customerID AS customerID,
  c.companyName AS companyName,
  c.contactTitle AS contactTitle,
  p.categoryName AS categoryName,
  ROUND(SUM(od.netSales), 1) AS TotalSales,
  COUNT(o.orderId) AS TotalOrders,
  SUM(od.profit) AS Profit
FROM
  {{ ref('stg_customer') }} c
  INNER JOIN {{ ref('stg_orders') }} o ON c.customerID = o.customerID
  INNER JOIN {{ ref('stg_order_detail') }} od ON od.orderID = o.orderID
  INNER JOIN {{ ref('raw_product') }} p ON p.productID = od.productID
GROUP BY
  c.customerID, c.companyName, c.contactTitle, p.categoryName
ORDER BY
  c.customerID