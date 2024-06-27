with stg_territories as (
    select * from {{ ref('stg_territories') }}
)

select
    territory_id,
    "territoryDescription",
    region_id
from stg_territories