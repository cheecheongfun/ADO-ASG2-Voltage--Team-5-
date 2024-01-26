with
order_detail as (
    select * from {{ ref('raw_order_details') }}
)

select
    orderid,
    sum(discount) as total_discount
from order_detail
group by orderid, productID
having total_discount < 0
