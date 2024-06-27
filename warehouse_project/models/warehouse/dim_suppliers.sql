with stg_suppliers as (
    select * from {{ ref('stg_suppliers') }}
)

select
    supplier_id,
    "companyName",
    "contactName",
    "contactTitle",
    address,
    city,
    region,
    "postalCode",
    country,
    phone,
    fax,
    "homePage"
from stg_suppliers
