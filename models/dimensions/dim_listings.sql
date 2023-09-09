{{
    config(
        materialized="view",
    )
}}

with raw_listings as (select * from airbnb.staging.listings_airbnb_paris)

select
    id as listing_id,
    host_id,
    name as listing_name,
    bedroom,
    bed,
    bath,
    neighbourhood,
    latitude,
    longitude,
    room_type,
    price,
    minimum_nights,
    number_of_reviews,
    last_review,
    reviews_per_month,
    calculated_host_listings_count,
    availability_365,
    number_of_reviews_ltm,
    nvl(license, 'Absente') as licence_type
from raw_listings
