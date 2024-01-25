SELECT 
  t.territoryID,
  t.territorydescription,
  e.employeeID,
  SUM(sod.netSales) as netSales
FROM
  {{ ref('raw_territory')}} t 
  INNER JOIN {{ref('raw_employee_territory')}} et ON t.territoryID = et.territoryID
  INNER JOIN {{ref('raw_employee')}} e ON et.employeeID = e.employeeID
  INNER JOIN {{ref('raw_orders')}} o ON o.employeeID = e.employeeID 
  INNER JOIN {{ref('stg_order_detail')}} sod ON sod.orderID = sod.orderID
GROUP BY t.territoryID, t.territorydescription, e.employeeID
