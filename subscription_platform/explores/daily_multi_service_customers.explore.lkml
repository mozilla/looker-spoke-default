include: "../views/daily_multi_service_customers.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: daily_multi_service_customers {
  label: "Daily Multi-Service Customers"

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }

  join: countries {
    sql_on: ${daily_multi_service_customers.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: service_ids {
    view_label: "Service IDs"
    from: daily_multi_service_customers__service_ids
    sql_table_name: UNNEST(daily_multi_service_customers.service_ids) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: service_names {
    from: daily_multi_service_customers__service_names
    sql_table_name: UNNEST(daily_multi_service_customers.service_names) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: product_names {
    from: daily_multi_service_customers__product_names
    sql_table_name: UNNEST(daily_multi_service_customers.product_names) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: plan_intervals {
    from: daily_multi_service_customers__plan_intervals
    sql_table_name: UNNEST(daily_multi_service_customers.plan_intervals) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }
}
