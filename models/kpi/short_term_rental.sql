{{
    config(
        materialized="table",
    )
}}
with short_term_rentals as (
    select listing_id, listing_name, host_name, minimum_nights from {{ ref('dim_listings_with_hosts') }}
    where minimum_nights < 7
    )

select *
from short_term_rentals
