with stg_employees as (
    select * from {{ ref('stg_employees') }}
)

select
    employee_id,
    "lastName",
    "firstName",
    title,
    "titleOfCourtesy",
    "birthDate",
    "hireDate",
    address,
    city,
    region,
    "postalCode",
    country,
    "homePhone",
    extension,
    photo,
    notes,
    "reportsTo",
    "photoPath"
from stg_employees
