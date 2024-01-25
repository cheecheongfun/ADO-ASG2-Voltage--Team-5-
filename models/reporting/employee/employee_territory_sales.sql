select 
et.territoryID,
SUM(sod.netSales) as netSales
from {{ref('raw_employee_territory')}} et
inner join {{ref('raw_employee')}} e on 
et.employeeID = e.employeeID
inner join {{ref('raw_orders')}} o on
o.employeeID = e.employeeID 
inner join {{ref('stg_order_detail')}} sod on
sod.orderID = sod.orderID