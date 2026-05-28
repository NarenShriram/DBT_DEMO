WITH BIKE AS(

SELECT 
DIStinct    
START_STATIO_ID as station_id,
START_STATION_NAME,
START_LAT,
START_LNG
from 
{{ source('demo', 'bike') }}
where RIDE_ID != 'ride_id'
)

select 
*
from bike