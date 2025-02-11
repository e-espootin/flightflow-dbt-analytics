

{{ 
    select_excel_source(
        source_name='external_source_excel',
        table_name='order',
        column_mappings={
            'Order ID': 'OrderID',
            'Customer ID': 'CustomerID',
            'Trip ID': 'TripID',
            'Price (EUR)': 'PriceEUR',
            'Seat No': 'SeatNo',
            'Status': 'Status'
        }
    ) 
}}