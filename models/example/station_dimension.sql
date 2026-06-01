WITH BIKE AS(

SELECT 
DIStinct    
START_STATIO_ID as station_id,
START_STATION_NAME,
START_LAT,
START_LNG
from 
{{ ref('stg_bike') }}
where RIDE_ID != 'bike_id'
)

select 
*
from bike