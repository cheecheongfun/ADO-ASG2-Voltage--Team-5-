SELECT
  r.regionID AS regionID,
  r.regionDescription AS regionDescription,
  SUM(od.revenue) AS revenue,
  SUM(od.netSales) AS netSales
FROM
  {{ref('stg_order_detail')}} od
  INNER JOIN {{ref('stg_orders')}} o ON o.orderID = od.orderID
  INNER JOIN {{ref('raw_employee')}} e ON e.employeeID = o.employeeID
  INNER JOIN {{ref('raw_employee_territory')}} et ON et.employeeID = e.employeeID
  INNER JOIN {{ref('raw_territory')}} rt ON rt.territoryID = et.territoryID
  INNER JOIN {{ref('raw_region')}} r ON r.regionID = rt.regionID
GROUP BY
    r.regionID, r.regionDescription

--testing