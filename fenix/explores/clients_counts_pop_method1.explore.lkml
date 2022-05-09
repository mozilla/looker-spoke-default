include: "../views/clients_counts_pop_method1.view.lkml"

# explore: clients_counts_pop_method1 {
#   sql_always_where: ${baseline_clients_daily_table.first_seen_date} >= '2020-01-01' ;;
#   view_name: client_counts
#   description: "count of clients."

#   always_filter: {
#     filters: [
#       submission_date: "3 years",
#     ]
#   }
# }
