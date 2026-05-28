with daily_weather as(

select 
date(time) as daily_weather,
WEATHER,
temp,
pressure,
humidity,
clouds
from {{ source('demo', 'weather') }}
),

daily_agg as (
select
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(humidity),2) as avg_humidity,
round(avg(clouds),2) as avg_clouds
from daily_weather
group by all
qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1

)

SELECT 
*
from daily_agg