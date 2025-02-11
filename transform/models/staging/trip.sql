{{ 
    select_excel_source(
        source_name='external_source_excel',
        table_name='trip',
        column_mappings={
            'Trip ID': 'TripID',
            'Origin City': 'Origin_City',
            'Destination City': 'Destination_City',
            'Airplane ID': 'AirplaneID',
            'Start Timestamp': 'Start_Timestamp',
            'End Timestamp': 'End_Timestamp'
        }
    ) 
}}