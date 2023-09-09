{{
    config(
        materialized="view",
    )
}}
with
    l as (select * from {{ ref("dim_listings") }}),
    h as (select * from {{ ref("dim_hosts") }})

select
    l.listing_id,
    l.host_id,
    l.listing_name,
    h.host_name,
    l.bedroom,
    l.minimum_nights,
    l.neighbourhood,
    l.availability_365,
    l.number_of_reviews_ltm,
    l.licence_type,
    l.latitude,
    l.longitude,
    l.room_type,
    l.price,
    l.number_of_reviews
from l
inner join h on (l.host_id = h.host_id)
