SELECT
  c.customerID as customerID,
  c.companyName as companyName,
  o.orderDate as orderDate,
  o.orderDay as orderDay,
  o.orderMonth AS orderMonth,
  o.orderYear AS orderYear,
  COUNT(o.orderID) AS total_orders,
  SUM(od.netSales) AS TotalSales,
  SUM(od.unitCost * od.quantity) AS TotalCost,
  ROUND(SUM(od.profit), 1) AS Profit,
  AVG(ProfitMargin) AS ProfitMargin
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('stg_orders')}} o ON c.customerID = o.customerID
  INNER JOIN {{ref("stg_order_detail")}} od ON o.orderid = od.orderid
GROUP BY
    c.customerID, c.companyName, o.orderDate, o.orderDay, o.orderMonth, o.orderYear
ORDER BY
    total_orders Desc