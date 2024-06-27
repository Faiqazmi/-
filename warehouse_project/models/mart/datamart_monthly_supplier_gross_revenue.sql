with supplier_revenue as (
    select
        s."companyName",
        date_trunc('month', o."orderDate"::timestamp) as month,
        sum((od."unitPrice" - (od."unitPrice" * od.discount)) * od.quantity) as gross_revenue
    from
        {{ ref('fact_orders') }} o
    join
        {{ ref('fact_order_details') }} od on o.order_id = od.order_id
    join
        {{ ref('dim_products') }} p on od.product_id = p.product_id
    join
        {{ ref('dim_suppliers') }} s on p.supplier_id = s.supplier_id
    group by
        s."companyName", date_trunc('month', o."orderDate"::timestamp)
)
select
    "companyName",
    month,
    gross_revenue
from
    supplier_revenue
order by
    "companyName", month