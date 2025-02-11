WITH row_count_check AS (
    SELECT COUNT(*) as row_count
    FROM {{ ref('aeroplane_model') }}
)

SELECT *
FROM row_count_check
WHERE row_count = 0