{% macro export_data_csv(table, s3_target_path) %}
    {% set query %}
        COPY (
            SELECT *
            FROM {{ table }}
        ) 
        TO '{{ s3_target_path }}/{{ table }}.csv'
        (FORMAT CSV, HEADER);
    {% endset %}

    {% do run_query(query) %}
{% endmacro %}