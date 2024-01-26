with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    sum(quantity) as total_quantity
from order_detail
group by orderid
having total_quantity <= 0
