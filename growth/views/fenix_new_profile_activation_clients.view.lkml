include: "//looker-hub/growth/views/fenix_new_profile_activation_clients.view.lkml"

view: +fenix_new_profile_activation_clients {


  measure: total_clients {
    type: count_distinct
    sql: ${client_id} ;;
    description: "Total number of clients"
  }


  measure: total_activated {
    type: count_distinct
    sql: CASE WHEN ${is_activated} THEN ${client_id} END;;
    description: "Total number of clients activated"
  }




   }
