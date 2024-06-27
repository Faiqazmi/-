with stg_regions as (
    select * from {{ ref('stg_regions') }}
)

select
    region_id,
    "regionDescription"
from stg_regions
