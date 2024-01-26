with closed_orders_count as (
    select
        employeeID,
        count(*) as closed_orders_count
    from {{ ref('stg_orders') }}
    where shippedDate is not null
    group by employeeID
)

SELECT TOP 3
  s.employeeID,
  SUM(coc.closed_orders_count) as closed_orders_count
FROM
  {{ref('raw_employee')}} s
  left join closed_orders_count coc
  ON coc.employeeID = s.employeeID
GROUP BY
    s.employeeID, coc.closed_orders_count
ORDER BY
    coc.closed_orders_count Desc