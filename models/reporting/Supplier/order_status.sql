SELECT
  orderID,
  shipcountry AS Country,
  CompanyName AS Courier,
  Status,
  Daystoship AS ProcessingTime,
  CAST(EXTRACT(DAY FROM CAST(OrderDate AS DATE)) AS INT) AS OrderDay,
  CAST(EXTRACT(MONTH FROM CAST(OrderDate AS DATE)) AS INT) AS OrderMonth,
  CAST(EXTRACT(YEAR FROM CAST(OrderDate AS DATE)) AS INT) AS OrderYear,
  Red,
  Green
FROM
  {{ ref('stg_shipment_status') }}
