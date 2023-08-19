include: "../views/logical_subscriptions.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: logical_subscriptions {

  join: countries {
    sql_on: ${logical_subscriptions.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

}
