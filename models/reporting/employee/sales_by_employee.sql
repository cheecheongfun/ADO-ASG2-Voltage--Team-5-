with closed_orders_count as (
    select
        employeeID,
        count(*) as closed_orders_count
    from {{ ref('stg_orders') }}
    where shippedDate is not null
    group by employeeID
)

SELECT 
  s.employeeID as employeeID,
  coc.closed_orders_count as closed_orders_count,
  SUM(sed.netSales) as netSales,
  SUM(sed.quantity) as quantity,
  SUM(sed.revenue) as revenue
FROM
  {{ref('raw_employee')}} s 
  left join closed_orders_count coc
  ON coc.employeeID = s.employeeID
  inner join {{ref('stg_orders')}} o  
  ON coc.employeeID = o.employeeID
  inner join {{ref('stg_order_detail')}} sed  
  ON o.orderID = sed.orderID
GROUP BY s.employeeID, coc.closed_orders_count




