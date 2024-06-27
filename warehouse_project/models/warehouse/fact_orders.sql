with stg_orders as (
    select * from {{ ref('stg_orders') }}
)

select
    order_id,
    customer_id,
    employee_id,
    "orderDate",
    "requiredDate",
    "shippedDate",
    "shipVia",
    freight,
    "shipName",
    "shipAddress",
    "shipCity",
    "shipRegion",
    "shipPostalCode",
    "shipCountry"
from stg_orders