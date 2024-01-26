SELECT TOP 3
  s.employeeID as employeeID,
  SUM(sod.netSales) as netSales
FROM
  {{ref('raw_employee')}} s
  INNER JOIN {{ref('stg_orders')}} o ON s.employeeID = o.employeeID
  INNER JOIN {{ref('stg_order_detail')}} sod ON o.orderID = sod.orderID
GROUP BY
    s.employeeID
ORDER BY
    netSales Desc