SELECT
  c.customerID as customerID,
  c.companyName as companyName,
  o.orderDate as orderDate,
  SUM(o.orderID) AS total_orders
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('raw_orders')}} o ON c.customerID = o.customerID
GROUP BY
    c.customerID, c.companyName, o.orderDate
ORDER BY
    total_orders Desc