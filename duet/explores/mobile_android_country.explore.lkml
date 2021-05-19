include: "../views/*.view.lkml"

explore: mobile_android_country {
  join: previous {
    from: mobile_android_country
    type: left_outer
    relationship:  many_to_one
    sql_on: ${mobile_android_country.join_field} = ${previous.join_field};;
  }
}
