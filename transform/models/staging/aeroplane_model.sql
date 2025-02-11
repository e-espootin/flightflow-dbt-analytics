
with ct0
as(
    select * from {{ source('external_source', 'aeroplane_model') }}
), ct1
as(
select 'Boeing' as manufacturer, '737-800' as model, unnest("Boeing"."737-800", recursive:= true) from ct0 as c
union all
select 'Boeing' as manufacturer, '777-300ER' as model, unnest("Boeing"."777-300ER", recursive:= true) from ct0 as c
union all
select 'Boeing' as manufacturer, '787-9' as model, unnest("Boeing"."787-9", recursive:= true) from ct0 as c
union all
select 'Airbus' as manufacturer, 'A320neo' as model, unnest("Airbus"."A320neo", recursive:= true) from ct0 as c
union all
select 'Airbus' as manufacturer, 'A350-900' as model, unnest("Airbus"."A350-900", recursive:= true) from ct0 as c
union all
select 'Airbus' as manufacturer, 'A380-800' as model, unnest("Airbus"."A380-800", recursive:= true) from ct0 as c
union all
select 'Embraer' as manufacturer, 'E190-E2' as model, unnest("Embraer"."E190-E2", recursive:= true) from ct0 as c
union all
select 'Embraer' as manufacturer, 'E175' as model, unnest("Embraer"."E175", recursive:= true) from ct0 as c
union all
select 'Embraer' as manufacturer, 'E195-E2' as model, unnest("Embraer"."E195-E2", recursive:= true) from ct0 as c
union all
select 'Bombardier' as manufacturer, 'CRJ900' as model, unnest("Bombardier"."CRJ900", recursive:= true) from ct0 as c
union all
select 'Bombardier' as manufacturer, 'Q400' as model, unnest("Bombardier"."Q400", recursive:= true) from ct0 as c
union all
select 'Cessna' as manufacturer, 'Citation X+' as model, unnest("Cessna"."Citation X+", recursive:= true) from ct0 as c
union all
select 'Cessna' as manufacturer, 'Citation Latitude' as model, unnest("Cessna"."Citation Latitude", recursive:= true) from ct0 as c
union all
select 'Gulfstream' as manufacturer, 'G650' as model, unnest("Gulfstream"."G650", recursive:= true) from ct0 as c
union all
select 'Gulfstream' as manufacturer, 'G550' as model, unnest("Gulfstream"."G550", recursive:= true) from ct0 as c
union all
select 'Dassault' as manufacturer, 'Falcon 7X' as model, unnest("Dassault"."Falcon 7X", recursive:= true) from ct0 as c
union all
select 'Dassault' as manufacturer, 'Falcon 2000LXS' as model, unnest("Dassault"."Falcon 2000LXS", recursive:= true) from ct0 as c
union all
select 'Mitsubishi' as manufacturer, 'SpaceJet M90' as model, unnest("Mitsubishi"."SpaceJet M90", recursive:= true) from ct0 as c
union all
select 'COMAC' as manufacturer, 'C919' as model, unnest("COMAC"."C919", recursive:= true) from ct0 as c
)

select 
    row_number() over() as id
    , c.manufacturer
    , c.model
    , c.max_seats
    , c.max_weight
    , c.max_distance
    , c.engine_type
 from ct1 as c