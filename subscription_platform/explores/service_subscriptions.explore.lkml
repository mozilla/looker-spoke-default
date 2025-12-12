include: "../views/service_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: service_subscriptions {
  join: countries {
    sql_on: ${service_subscriptions.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: retention_by_month {
    from: service_subscriptions__retention_by_month
    # The `sql` parameter was deprecated in Looker 3.12, so this should use `sql_table_name`,
    # but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql: LEFT JOIN UNNEST(${service_subscriptions.month_numbers}) AS retention_by_month ;;
    type: left_outer
    relationship: one_to_many
  }

  join: subscription_other_services {
    from: service_subscriptions__other_services
    # This should use a dimension reference, but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql_table_name: UNNEST(service_subscriptions.other_services) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'service_subscriptions_v1' ;;
    type: left_outer
    relationship: many_to_one
  }
}
