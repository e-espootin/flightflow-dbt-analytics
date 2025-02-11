
Table fact_orders {
  OrderID int [pk]
  CustomerID int [ref: > dim_customers.CustomerID]
  AirplaneID int [ref: > dim_aeroplanes.AirplaneID]
  DateID int [ref: > dim_date.DateID]
  PriceEUR decimal
  SeatNo varchar
  Status varchar
  Origin_City varchar
  Destination_City varchar
  departure_time timestamp
  arrival_time timestamp
  CustomerGroupID int
  Order_date timestamp
}


Table dim_customers {
  CustomerID int [pk]
  Name varchar
  Email varchar
  Phone_Number varchar
  CustomerGroupName varchar
  CustomerGroupType varchar
  Registry_Number varchar
}

Table dim_aeroplanes {
  AirplaneID int [pk]
  Airplane_Model varchar
  Manufacturer varchar
  max_seats int
  max_weight decimal
  max_distance decimal
  engine_type varchar
}

Table dim_date {
  DateID int [pk]
  FullDate date
  DayOfWeek int
  DayName varchar
  DayOfMonth int
  DayOfYear int
  WeekOfYear int
  MonthNumber int
  MonthName varchar
  Quarter int
  Year int
  IsWeekend boolean
  IsHoliday boolean
}

// Relationships
// Ref: fact_orders.CustomerID > dim_customers.CustomerID
// Ref: fact_orders.AirplaneID > dim_aeroplanes.AirplaneID
// Ref: fact_orders.DateID > dim_date.DateID