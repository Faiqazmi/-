with employee_revenue as (
    select
        e."firstName" || ' ' || e."lastName" as employee_name,
        date_trunc('month', o."orderDate"::timestamp) as month,
        sum((od."unitPrice" - (od."unitPrice" * od.discount)) * od.quantity) as gross_revenue
    from
        {{ ref('fact_orders') }} o
    join
        {{ ref('fact_order_details') }} od on o.order_id = od.order_id
    join
        {{ ref('dim_employees') }} e on o.employee_id = e.employee_id
    group by
        e."firstName", e."lastName", date_trunc('month', o."orderDate"::timestamp)
)
select
    employee_name,
    month,
    gross_revenue
from
    employee_revenue
order by
    month, gross_revenue desc
