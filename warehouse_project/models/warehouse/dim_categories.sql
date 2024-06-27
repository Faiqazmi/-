with stg_categories as (
    select * from {{ ref('stg_categories') }}
)
select
    category_id,
    "categoryName",
    description,
    picture
from stg_categories
