{{
    config(
        materialized="table",
    )
}}

with license_listings as (
        select
            licence_type,
            count(*) as total_listings
        from {{ ref("dim_listings") }}
        group by licence_type
    )
select *
from license_listings
