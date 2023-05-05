include: "../views/channel_group_proportions_table.view"
include: "/shared/views/*"
explore: channel_group_proportions_table {

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${channel_group_proportions_table.coupon_code} = ${countries.code} ;;
  }
}
