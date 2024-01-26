with
raw_product as (
    select * from {{ ref('raw_product') }}
)

select
    productid,
    sum(unitCost) as total_uc
from raw_product
group by productId
having total_uc < 0
