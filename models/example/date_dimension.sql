WITH CTE AS (
SELECT
TO_TIMESTAMP(STARTED_AT) as started_at,
DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,

{{day_type('STARTED_AT')}} AS DAY_TYPE,


{{function1('STARTED_AT')}} AS WEATHER



FROM {{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

SELECT 
*
FROM CTE 