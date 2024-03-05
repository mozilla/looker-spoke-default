include: "//looker-hub/firefox_desktop/views/messaging_system.view"

view: +messaging_system {
}

# view: messaging_system__ping_info__experiments {
#   label: "Ping Info - Experiments"

#   dimension: document_id {
#     type: string
#     sql: ${messaging_system.document_id} ;;
#     hidden: yes
#   }

#   dimension: document_label_id {
#     type: string
#     sql: ${messaging_system.document_id} || "-" || ${key} ;;
#     primary_key: yes
#     hidden: yes
#   }

#   dimension: key {
#     type: string
#     sql: ${TABLE}.key ;;
#     suggest_explore: suggest__messaging_system__ping_info__experiments
#     suggest_dimension: suggest__messaging_system__ping_info__experiments.key
#     hidden: no
#   }

#   dimension: value__branch {
#     type: string
#     sql: ${TABLE}.value.branch ;;
#     hidden: no
#   }

#   dimension: value__extra__enrollment_id {
#     type: string
#     sql: ${TABLE}.value.extra.enrollment_id ;;
#     hidden: no
#   }

#   dimension: value__extra__type {
#     type: string
#     sql: ${TABLE}.value.extra.type ;;
#     hidden: no
#   }
# }

# view: suggest__messaging_system__ping_info__experiments {
#   derived_table: {
#     sql: select
#           e.key,
#           count(*) as n
#       from mozdata.firefox_desktop.messaging_system as t,
#       unnest(ping_info.experiments) as e
#       where date(submission_timestamp) > date_sub(current_date, interval 30 day)
#           and sample_id = 0
#       group by key
#       order by n desc ;;
#   }

#   dimension: key {
#     type: string
#     sql: ${TABLE}.key ;;
#   }
# }
