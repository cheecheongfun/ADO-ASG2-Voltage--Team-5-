SELECT
  c.customerID as customerID,
  c.companyName as companyName,
  SUM(o.orderID) AS total_orders
FROM
  {{ref('raw_customer')}} c
  INNER JOIN {{ref('raw_orders')}} o ON c.customerID = o.customerID
GROUP BY
    c.customerID, c.companyName
ORDER BY
    total_orders Desc