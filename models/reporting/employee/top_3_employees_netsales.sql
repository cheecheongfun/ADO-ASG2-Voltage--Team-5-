SELECT TOP 3
  se.employeeID as employeeID,
  SUM(sod.netSales) as netSales
FROM
  {{ref('stg_employee')}} se
  INNER JOIN {{ref('stg_orders')}} o ON se.employeeID = o.employeeID
  INNER JOIN {{ref('stg_order_detail')}} sod ON o.orderID = sod.orderID
GROUP BY
    se.employeeID
ORDER BY
    netSales Desc