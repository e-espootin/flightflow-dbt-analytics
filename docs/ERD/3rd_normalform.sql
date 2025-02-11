// Fact Table
Table fact_order {
  OrderID int [pk]
  CustomerID int [ref: > dim_customer.CustomerID]
  TripID int [ref: > dim_trip.TripID]
  PriceEUR decimal
  SeatNo varchar
  Status varchar
  created_at timestamp
}

// Dimension Tables
Table dim_customer {
  CustomerID int [pk]
  Name varchar
  Email varchar
  Phone_Number varchar
  CustomerGroupID int [ref: > dim_customer_group.CustomerGroupID]
}

Table dim_customer_group {
  CustomerGroupID int [pk]
  Name varchar
  Type varchar
  Registry_Number varchar
}

Table dim_aeroplane {
  AirplaneID int [pk]
  Airplane_Model varchar [ref: > dim_aeroplane_model.model]
  Manufacturer varchar
}

Table dim_aeroplane_model {
  model varchar [pk]
  max_seats int
  max_weight decimal
  max_distance decimal
  engine_type varchar
}

Table dim_trip {
  TripID int [pk]
  Origin_City varchar
  Destination_City varchar
  AirplaneID int [ref: > dim_aeroplane.AirplaneID]
  Start_Timestamp timestamp
  End_Timestamp timestamp
}

// Indexes
Ref: fact_order.CustomerID > dim_customer.CustomerID
Ref: fact_order.TripID > dim_trip.TripID
Ref: dim_trip.AirplaneID > dim_aeroplane.AirplaneID
Ref: dim_aeroplane.Airplane_Model > dim_aeroplane_model.model
Ref: dim_customer.CustomerGroupID > dim_customer_group.CustomerGroupID