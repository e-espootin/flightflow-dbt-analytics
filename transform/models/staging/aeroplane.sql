{{ config(  materialized='table',
            tags=['example_test']
         )
}}

with CTE
as
(
    SELECT 
        "Airplane ID" as AirplaneID,
        "Airplane Model" as Airplane_Model,
        "Manufacturer" as Manufacturer

    FROM {{source('external_source_excel', 'aeroplane')}}
)
SELECT * FROM CTE
