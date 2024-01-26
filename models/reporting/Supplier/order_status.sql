SELECT
  orderID,
  shipcountry AS Country,
  CompanyName AS Courier,
  Status,
  ROUND(Daystoship) AS ProcessingTime,
  CAST(EXTRACT(DAY FROM orderDate) AS INTEGER) AS orderDay,
  CAST(EXTRACT(MONTH FROM orderDate) AS INTEGER) AS orderMonth,
  CAST(EXTRACT(YEAR FROM orderDate) AS INTEGER) AS orderYear,
  Red,
  Green
FROM
  {{ ref('stg_shipment_status') }}
