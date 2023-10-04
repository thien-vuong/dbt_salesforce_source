{{ config(enabled=var('salesforce__user_history_enabled', False)) }}

with base as (

    select *
    from {{ ref('stg_salesforce__user_history_tmp') }}
), 

fields as (

    select

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_salesforce__user_history_tmp')),
                staging_columns=get_user_history_columns()
            )
        }}

    from base
), 

final as (
    
    select 
        id as user_id,
        _fivetran_active,        
        cast(_fivetran_start as {{ dbt.type_timestamp() }}) as _fivetran_start,
        cast(_fivetran_end as {{ dbt.type_timestamp() }}) as _fivetran_end, 
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        account_id,
        alias,
        city,
        company_name,
        contact_id,
        country, 
        department,
        email,
        first_name,
        individual_id,
        is_active,
        cast(last_login_date as {{ dbt.type_timestamp() }}) as last_login_date,
        last_name,
        cast(last_referenced_date as {{ dbt.type_timestamp() }}) as last_referenced_date,
        cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
        manager_id,
        name as user_name,
        postal_code,
        profile_id,
        state,
        street,
        title,
        user_role_id,
        user_type,
        username 
        
        {{ fivetran_utils.fill_pass_through_columns('salesforce__user_history_pass_through_columns') }}
    
    from fields
)

select * 
from final