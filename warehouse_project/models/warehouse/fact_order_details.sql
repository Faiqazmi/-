with stg_order_details as (
    select * from {{ ref('stg_order_details') }}
)

select
    order_id,
    product_id,
    "unitPrice",
    quantity,
    discount
from stg_order_details