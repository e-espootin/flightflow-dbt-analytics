WITH 
cte_aeroplane AS (
    SELECT
        *
    FROM {{ ref('aeroplane') }}
),
cte_aeroplane_model AS (
    SELECT
        *
    FROM {{ ref('aeroplane_model') }}
)

SELECT
    a.AirplaneID
    , a.Airplane_Model
    , a.Manufacturer
    , am.max_seats
    , am.max_weight
    , am.max_distance
    , am.engine_type
FROM cte_aeroplane a
INNER JOIN cte_aeroplane_model am
    ON a.Airplane_Model = am.model