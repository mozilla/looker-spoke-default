include: "//looker-hub/fenix/views/new_profile_activation_table.view.lkml"

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

  dimension: adjust_adgroup {
    group_label: "Adjust parameters"
    type: string
    sql: ${TABLE}.adjust_adgroup ;;
  }

  dimension: adjust_campaign {
    group_label: "Adjust parameters"
    type: string
    sql: ${TABLE}.adjust_campaign ;;
  }

  dimension: adjust_creative {
    group_label: "Adjust parameters"
    type: string
    sql: ${TABLE}.adjust_creative ;;
  }

  dimension: adjust_network {
    group_label: "Adjust parameters"
    type: string
    sql: ${TABLE}.adjust_network ;;
  }

}
