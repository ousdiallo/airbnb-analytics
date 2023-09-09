{{
    config(
        materialized="table",
    )
}}
with
    room_type_stats as (
        select
            room_type,
            count(*) as total_listings,
            avg(price) as avg_price,
            avg(minimum_nights) as avg_minimum_nights,
            avg(number_of_reviews) as avg_reviews
        from {{ ref("dim_listings") }}
        group by room_type
    )

select *
from room_type_stats
