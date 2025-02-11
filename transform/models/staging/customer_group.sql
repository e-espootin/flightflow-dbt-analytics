{{ 
    select_excel_source(
        source_name='external_source_excel',
        table_name='customer_group',
        column_mappings={
            'ID': 'CustomerGroupID',
            'Type': 'Type',
            'Name': 'Name',
            'Registry number': 'Registry_Number',
        }
    ) 
}}