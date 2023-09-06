{% macro get_user_role_history_columns() %}

{% set columns = [
    {"name": "_fivetran_active", "datatype": "boolean"},
    {"name": "_fivetran_end", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_start", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "developer_name", "datatype": dbt.type_string()},
    {"name": "forecast_user_id", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "opportunity_access_for_account_owner", "datatype": dbt.type_string()},
    {"name": "parent_role_id", "datatype": dbt.type_string()},
    {"name": "rollup_description", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('salesforce__user_role_history_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}