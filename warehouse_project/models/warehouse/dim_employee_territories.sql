with stg_employee_territories as (
    select * from {{ ref('stg_employee_territories') }}
)

select
    employee_id,
    territory_id
from stg_employee_territories
