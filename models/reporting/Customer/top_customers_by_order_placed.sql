SELECT
  c.customerID as customerID,
  c.companyName as companyName,
  o.orderDate as orderDate,
  o.orderDay as orderDay,
  o.orderMonth AS orderMonth,
  o.orderYear AS orderYear,
  SUM(o.orderID) AS total_orders
FROM
  {{ref('stg_customer')}} c
  INNER JOIN {{ref('stg_orders')}} o ON c.customerID = o.customerID
GROUP BY
    c.customerID, c.companyName, o.orderDate, o.orderDay, o.orderMonth, o.orderYear
ORDER BY
    total_orders Desc