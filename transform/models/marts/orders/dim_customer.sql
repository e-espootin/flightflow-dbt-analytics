with 
cte_customer AS (
    SELECT
        *
    FROM {{ ref('customer') }}
),
cte_customer_group AS (
    SELECT
        *
    FROM {{ ref('customer_group') }}
)

SELECT
    c.CustomerID
    , SPLIT_PART(c.Name, ' ', 1) AS FirstName
    , SPLIT_PART(c.Name, ' ', 2) AS LastName
    , c.Email
    , c.Phone_Number
    , c.CustomerGroupID
    , cg.Name as CustomerGroupName
    , cg.Type as CustomerGroupType
    , cg.Registry_Number
FROM cte_customer c
INNER JOIN cte_customer_group cg
    ON c.CustomerGroupID = cg.CustomerGroupID

