# include: "//looker-hub/operational_monitoring/views/tcp_rollout_phase_2.view.lkml"


# view: +tcp_rollout_phase_2 {
#   measure: Total {
#     type: number
#     sql: SUM(${TABLE}.value.sum) ;;
#   }

#   measure: Average {
#     type: number
#     sql: AVG(${TABLE}.value.sum) ;;
#   }

#   dimension: submission_date {
#     datatype: date
#   }

#   dimension: country {
#     sql: ${TABLE}.country ;;
#     type: string
#     map_layer_name: countries
#   }

#   dimension: os {
#     sql: ${TABLE}.os ;;
#     type: string
#   }
# }
