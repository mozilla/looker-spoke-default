include: "../views/channel_group_proportions_table.view"
include: "/shared/views/countries.view.lkml"
explore: channel_group_proportions_table {

  join: countries {
    type: left_outer
    relationship: many_to_one
    sql_on: UPPER(${channel_group_proportions_table.country})= ${countries.code} ;;
  }
}
