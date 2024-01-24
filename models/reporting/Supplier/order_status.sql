SELECT
  orderID,
  shipcountry AS Country,
  CompanyName AS Courier,
  Status,
  Daystoship AS LeadTime,
  EXTRACT(DAY FROM CAST(OrderDate AS DATE)) AS OrderDay,
  EXTRACT(MONTH FROM CAST(OrderDate AS DATE)) AS OrderMonth,
  EXTRACT(YEAR FROM CAST(OrderDate AS DATE)) AS OrderYear,
  Red,
  Green
FROM
  {{ ref('stg_shipment_status') }}
