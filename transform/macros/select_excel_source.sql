{% macro select_excel_source(source_name, table_name, column_mappings, start_date, end_date) %}

    {% set source_relation = source(source_name, table_name) %}

    with source as (
        select * from {{ source_relation }}
    ),

    renamed as (
        select
            {% for original_col, new_col in column_mappings.items() %}
                "{{ original_col }}" as {{ new_col }}
                {%- if not loop.last %},{% endif %}
            {% endfor %}
        from source
    )

    select * from renamed

{% endmacro %}