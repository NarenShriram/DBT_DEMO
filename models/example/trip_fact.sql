WITH trips AS(

SELECT 
RIDE_ID,
DATE(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE,
START_STATIO_ID as  START_STATION_ID,
END_STATION_ID,
MEMBER_CSUAL as member_casual,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) as trip_duration_seconds

from 
{{ ref('stg_bike') }}

where RIDE_ID != 'bikeid' and STARTED_AT != 'starttime' and STARTED_AT != '"starttime"'
)

select 
*
from trips