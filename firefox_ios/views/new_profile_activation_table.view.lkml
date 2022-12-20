include: "//looker-hub/firefox_ios/views/new_profile_activation_table.view.lkml"

view: +new_profile_activation_table {

  dimension: activated {
    hidden: yes
    sql: ${TABLE}.activated ;;
  }

  measure: activated_sum {
    label: "Activated"
    type: sum
    sql: ${TABLE}.activated ;;
  }

  dimension: new_profile {
    hidden: yes
    sql: ${TABLE}.new_profile ;;
  }

  measure: new_profile_sum {
    label: "New Profiles"
    type: sum
    sql: ${TABLE}.new_profile ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activated_sum}/ NULLIF(${new_profile_sum},0) ;;
  }

}
