SELECT 
  se.employeeID as employeeID,
  se.closed_orders_count as closed_orders_count,
  SUM(sed.netSales) as netSales,
  SUM(sed.quantity) as quantity,
  SUM(sed.revenue) as revenue
FROM
  {{ref('stg_employee')}} se  
  inner join {{ref('raw_orders')}} o  
  ON se.employeeID = o.employeeID
  inner join {{ref('stg_order_detail')}} sed  
  ON o.orderID = sed.orderID
GROUP BY se.employeeID