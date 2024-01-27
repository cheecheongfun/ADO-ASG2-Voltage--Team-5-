select
se.employeeID,
se.firstname,
se.hiredate,
se.homephone,
se.reportsTo,
sc.address,
p.productID,
p.categoryName
from 
{{ref("stg_employee")}} se INNER JOIN {{ref("stg_orders")}} so
ON se.employeeID = so.employeeID
INNER JOIN {{ref("stg_customer")}} sc ON so.customerID = sc.customerID
INNER JOIN {{ref("stg_order_detail")}} sod ON so.orderID = sod.orderID
INNER JOIN {{ref("raw_product")}} p ON sod.productID = p.productID