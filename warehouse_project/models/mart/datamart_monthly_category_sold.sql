with category_sales as (
    select
        c."categoryName",
        date_trunc('month', o."orderDate"::timestamp) as month,
        sum(od.quantity) as total_sold
    from
        {{ ref('fact_orders') }} o
    join
        {{ ref('fact_order_details') }} od on o.order_id = od.order_id
    join
        {{ ref('dim_products') }} p on od.product_id = p.product_id
    join
        {{ ref('dim_categories') }} c on p.category_id = c.category_id
    group by
        c."categoryName", date_trunc('month', o."orderDate"::timestamp)
)
select
    "categoryName",
    month,
    total_sold
from
    category_sales
order by
    month, total_sold desc