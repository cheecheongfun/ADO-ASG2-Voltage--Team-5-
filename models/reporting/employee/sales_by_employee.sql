SELECT 
  se.employeeID as employeeID
  se.firstname as firstname
  se.hiredate as hiredate
  t.territoryID as territoryID
  t.regionID as regionID
  sed.discount as discount
  sed.netSales as netSales
  sed.quantity as quantity
  sed.revenue as revenue
  sed.Unitprice as Unitprice
  se.closed_orders_count as closed_orders_count
  from {{ ref ('stg_employee')}} se 
  inner join {{ ref ('raw_territory')}} t
  on se.employeeID = t.employeeID
  inner join {{ ref ('raw_orders')}} o 
  on se.employeeID = o.employeeID
  inner join {{ ref ('stg_order_detail')}} sed 
  on o.orderID inner join sed.orderID
  group by se.employeeID



--{{ ref ('raw_order_details')}}

