SELECT TOP 3
  employeeID,
  SUM(closed_orders_count) as closed_orders_count
FROM
  {{ref('stg_employee')}} se
GROUP BY
    se.employeeID
ORDER BY
    closed_orders_count Desc