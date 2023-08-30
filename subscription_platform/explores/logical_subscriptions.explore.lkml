include: "../views/logical_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: logical_subscriptions {

  join: countries {
    sql_on: ${logical_subscriptions.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'logical_subscriptions_history_v1' ;;
    type: left_outer
    relationship: many_to_one
  }

}
