{{config (materialized = 'view')}}

with closed_orders_count as (
    select
        employeeID,
        count(*) as closed_orders_count
    from {{ ref('stg_orders') }}
    where shippedDate is not null
    group by employeeID
)
select
    e.*,
    coalesce(c.closed_orders_count, 0) as closed_orders_count
from {{ ref('raw_employee') }} as e
left join closed_orders_count as c
on e.employeeID = c.employeeID


