{{
    config(
        materialized="table",
    )
}}

with
    listings_per_host as (
        select host_id, host_name, count(*) as total_listings
        from {{ ref("dim_listings_with_hosts") }}
        group by host_id, host_name
    )

select *
from listings_per_host
