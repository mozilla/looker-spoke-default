# If necessary, uncomment the line below to include explore_source.
include: "//looker-hub/fenix/explores/metrics.explore.lkml"

view: database_sizes_mb {
  derived_table: {
    explore_source: metrics {
      column: metrics__memory_distribution__glean_database_size__sum {}
      column: clients {}
      derived_column: database_size_sum_mb {
        sql: (metrics__memory_distribution__glean_database_size__sum)/1024/1024 ;;
        }
      derived_column: database_size_tiers{
        sql: (metrics__memory_distribution__glean_database_size__sum)/1024/1024;;
        }
      }
    }

    dimension: metrics__memory_distribution__glean_database_size__sum {
      label: "Metrics Glean Database Size Sum"
      description: "The size of the database file at startup."
      type: number

    }

    dimension: clients {
      label: "Metrics Glean number of clients"
      description: "number of clients at startup."
      type: number

    }

    dimension: database_size_sum_mb {
      label: " Metrics Glean Database Size Sum in MB"
      description: "The size of the database file at startup in  MB."
      type: number

    }

    dimension: database_size_tiers {
      type: tier
      tiers: [0,5, 10,15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95]
      style: integer
   }

  }
