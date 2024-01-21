SELECT TOP 5
  c.customerID as customerID,
  c.companyName as companyName,
  SUM(od.netSales) AS netSales
FROM
  {{ref('stg_order_detail')}} od
  INNER JOIN {{ref('raw_orders')}} o ON o.orderID = od.orderID
  INNER JOIN {{ref('stg_customer')}} c ON c.customerID = o.customerID
GROUP BY
    c.customerID, c.companyName
ORDER BY
    netSales Desc