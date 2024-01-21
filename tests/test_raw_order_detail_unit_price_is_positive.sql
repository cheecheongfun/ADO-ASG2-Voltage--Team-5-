with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    sum(unitPrice) as total_up
from order_detail
group by orderid
having total_up < 0
