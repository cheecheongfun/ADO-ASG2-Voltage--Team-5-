with
raw_orders as (
    select * from {{ ref('raw_orders') }}
)

select
    orderID,
    sum(freight) as total_freight
from raw_orders
group by orderId
having total_freight <= 0