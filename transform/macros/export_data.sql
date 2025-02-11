{% macro export_data(table, order_date, s3_target_path) %}
{% set s3_path = env_var('TRANSFORM_S3_PATH_OUTPUT', 'a') %}
    COPY (
        SELECT *,
            YEAR({{ order_date }}) AS year, 
            MONTH({{ order_date }}) AS month 
        FROM {{ table }}
    ) 
    TO '{{ s3_target_path }}/{{ table }}'
     (FORMAT PARQUET, PARTITION_BY (year, month), OVERWRITE_OR_IGNORE 1, COMPRESSION 'ZSTD', ROW_GROUP_SIZE 1000000);
{% endmacro %}