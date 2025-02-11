{{ 
    select_excel_source(
        source_name='external_source_excel',
        table_name='customer',
        column_mappings={
            'Customer ID': 'CustomerID',
            'Name': 'Name',
            'Customer Group ID': 'CustomerGroupID',
            'Email': 'Email',
            'Phone Number': 'Phone_Number'
        }
    ) 
}}