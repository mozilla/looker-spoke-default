# If necessary, uncomment the line below to include explore_source.
include: "//looker-hub/fenix/views/metrics.view.lkml"

view: database_sizes_mb {
  extends: [metrics]

  dimension: database_size_sum_mb {
    label: " Metrics Glean Database Size Sum in MB"
    description: "The size of the database file at startup in  MB."
    type: number
    sql: (${metrics__memory_distribution__glean_database_size__sum})/1024/1024 ;;
    }

  dimension: database_size_tiers{
    label: "Database Size Tiers"
    type: tier
    tiers: [0, 5, 10,15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95]
    style: integer
    sql: (${metrics__memory_distribution__glean_database_size__sum})/1024/1024;;
    }

    }
