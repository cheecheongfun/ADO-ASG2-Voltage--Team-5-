with
stg_customer as (
    select * from {{ ref('stg_customer') }}
)

select
    customerID,
    address
from stg_customer
where address is null