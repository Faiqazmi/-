with stg_shippers as (
    select * from {{ ref('stg_shippers') }}
)

select
    shipper_id,
    "companyName",
    phone
from stg_shippers
