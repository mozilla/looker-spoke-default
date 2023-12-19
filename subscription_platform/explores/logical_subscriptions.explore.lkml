include: "../views/logical_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: logical_subscriptions {
  join: countries {
    sql_on: ${logical_subscriptions.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: retention_by_month {
    from: logical_subscriptions__retention_by_month
    # The `sql` parameter was deprecated in Looker 3.12, so this should use `sql_table_name`,
    # but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql: LEFT JOIN UNNEST(${logical_subscriptions.month_numbers}) AS retention_by_month ;;
    type: left_outer
    relationship: one_to_many
  }

  join: subscription_services {
    from: logical_subscriptions__services
    # This should use a dimension reference, but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql_table_name: UNNEST(logical_subscriptions.services) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'logical_subscriptions_history_v1' ;;
    type: left_outer
    relationship: many_to_one
  }
}
