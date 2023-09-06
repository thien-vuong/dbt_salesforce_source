{% macro get_contact_history_columns() %}

{% set columns = [
    {"name": "_fivetran_active", "datatype": "boolean"},
    {"name": "_fivetran_end", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_start", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "description", "datatype": dbt.type_string()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "home_phone", "datatype": dbt.type_string()}, 
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "individual_id", "datatype": dbt.type_string()}, 
    {"name": "is_deleted", "datatype": "boolean"}, 
    {"name": "last_activity_date", "datatype": "date"},
    {"name": "last_modified_by_id", "datatype": dbt.type_string()},
    {"name": "last_modified_date", "datatype": dbt.type_timestamp()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "last_referenced_date", "datatype": dbt.type_timestamp()},
    {"name": "last_viewed_date", "datatype": dbt.type_timestamp()},
    {"name": "lead_source", "datatype": dbt.type_string()},
    {"name": "mailing_city", "datatype": dbt.type_string()},
    {"name": "mailing_country", "datatype": dbt.type_string()},
    {"name": "mailing_postal_code", "datatype": dbt.type_string()},
    {"name": "mailing_state", "datatype": dbt.type_string()},
    {"name": "mailing_street", "datatype": dbt.type_string()}, 
    {"name": "master_record_id", "datatype": dbt.type_string()},
    {"name": "mobile_phone", "datatype": dbt.type_string()}, 
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "owner_id", "datatype": dbt.type_string()}, 
    {"name": "phone", "datatype": dbt.type_string()},
    {"name": "reports_to_id", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('salesforce__contact_history_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}