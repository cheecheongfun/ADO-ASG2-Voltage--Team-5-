SELECT
  c.customerID as customerID,
  c.companyName as companyName,
  COUNT(o.orderID) AS total_orders
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('stg_orders')}} o ON c.customerID = o.customerID
GROUP BY
    c.customerID, c.companyName
ORDER BY
    total_orders Desc