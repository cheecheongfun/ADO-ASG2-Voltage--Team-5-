SELECT
  orderID,
  shipcountry AS Country,
  CompanyName AS Courier,
  Status,
  Daystoship AS ProcessingTime,
  CAST(OrderDate AS DATE) AS OrderDate,
  Red,
  Green
FROM
  {{ ref('stg_shipment_status') }}
