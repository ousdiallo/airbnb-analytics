{{
    config(
        materialized="table",
    )
}}

with
    top_hosts as (
        select host_id, host_name, count(*) as total_listings
        from {{ ref("dim_listings_with_hosts") }}
        group by host_id, host_name
        order by total_listings desc
        limit 20
    )

select *
from top_hosts
