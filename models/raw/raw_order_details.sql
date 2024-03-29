{{ config (materialized='incremental', unique_key="ORDERID")}}
SELECT *
FROM {{ref('order_details_fresh')}}
{% if is_incremental()%}
WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM {{this}})
{%endif%}