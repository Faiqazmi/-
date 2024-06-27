with stg_customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    "companyName",
    "contactName",
    "contactTitle",
    address,
    city,
    region,
    "postalCode",
    country,
    phone,
    fax
from stg_customers
