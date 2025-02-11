{{ config(
    unique_key='OrderID' 
) }}

WITH cte_order AS (
    SELECT
        *
    FROM {{ ref('order') }}
    {% if is_incremental() %}
    WHERE OrderID > (SELECT MAX(OrderID) FROM {{ this }})
    {% endif %}
),

cte_trip AS (
    SELECT
        *
    FROM {{ ref('trip') }}
),

cte_customer AS (
    SELECT
        *
    FROM {{ ref('customer') }}
)

SELECT
    o.OrderID
    , cast(o.CustomerID as int) as CustomerID
    , o.TripID
    , cast(o.PriceEUR as decimal(10,2)) as PriceEUR
    , cast(o.SeatNo as varchar(10)) as SeatNo
    , o.Status
    , t.Origin_City
    , t.Destination_City
    , cast(t.AirplaneID as int) as AirplaneID
    , t.Start_Timestamp as departure_time
    , t.End_Timestamp as arrival_time
    , cast(c.CustomerGroupID as int) as CustomerGroupID
    , cast(t.Start_Timestamp as date) as order_date -- make a imaginary date column from partition parquet file
FROM cte_order o
INNER JOIN cte_trip t
    ON o.TripID = t.TripID
INNER JOIN cte_customer c
    ON o.CustomerID = c.CustomerID