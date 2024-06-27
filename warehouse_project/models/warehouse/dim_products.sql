with stg_products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    "productName",
    supplier_id,
    category_id,
    "quantityPerUnit",
    "unitPrice",
    "unitsInStock",
    "unitsOnOrder",
    "reorderLevel",
    "discontinued"
from stg_products
