{{
    config(
        materialized="view",
    )
}}

with raw_hosts as (select * from airbnb.staging.hosts_airbnb_paris)

select *
from raw_hosts
where host_id is not null and host_name is not null
