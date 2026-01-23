include: "//looker-hub/firefox_crash_metrics/views/crashing_users_aggregates.view.lkml"

view: +crashing_users_aggregates {
# Constants as dimensions (read-only, hidden from users)
  dimension: PROCESS_TYPE_MAIN {
    hidden: yes
    type: number
    sql: 1 ;;
  }

  dimension: PROCESS_TYPE_CONTENT {
    hidden: yes
    type: number
    sql: 2 ;;
  }

  dimension: PROCESS_TYPE_GMPLUGIN {
    hidden: yes
    type: number
    sql: 4 ;;
  }

  dimension: PROCESS_TYPE_GPU {
    hidden: yes
    type: number
    sql: 8 ;;
  }

  dimension: PROCESS_TYPE_RDD {
    hidden: yes
    type: number
    sql: 16 ;;
  }

  dimension: PROCESS_TYPE_SOCKET {
    hidden: yes
    type: number
    sql: 32 ;;
  }

  dimension: PROCESS_TYPE_UTILITY {
    hidden: yes
    type: number
    sql: 64 ;;
  }

  dimension: CLASSIFY_NONE {
    hidden: yes
    type: number
    sql: 1 ;;
  }

  dimension: CLASSIFY_OOM {
    hidden: yes
    type: number
    sql: 2 ;;
  }

  dimension: CLASSIFY_BACKGROUND_TASK {
    hidden: yes
    type: number
    sql: 4 ;;
  }

  dimension: CLASSIFY_SHUTDOWN_HANG {
    hidden: yes
    type: number
    sql: 8 ;;
  }

# Base dimensions for the bitsets
  dimension: process_types_bitset {
    type: number
    sql: ${TABLE}.process_types_bitset ;;
  }

  dimension: classifications_bitset {
    type: number
    sql: ${TABLE}.classifications_bitset ;;
  }

# Single multi-select parameter for process types
  filter: process_types_filter {
    type: string
    label: "Process Types"
    suggest_dimension: process_type_options
  }

# Helper dimension for process type suggestions
  dimension: process_type_options {
    type: string
    hidden: yes
    case: {
      when: {
        sql: 1=1 ;;
        label: "Main"
      }
      when: {
        sql: 1=1 ;;
        label: "Content"
      }
      when: {
        sql: 1=1 ;;
        label: "GMPlugin"
      }
      when: {
        sql: 1=1 ;;
        label: "GPU"
      }
      when: {
        sql: 1=1 ;;
        label: "RDD"
      }
      when: {
        sql: 1=1 ;;
        label: "Socket"
      }
      when: {
        sql: 1=1 ;;
        label: "Utility"
      }
    }
  }

# Single multi-select parameter for classifications
  filter: classifications_filter {
    type: string
    label: "Classifications"
    suggest_dimension: classification_options
  }

# Helper dimension for classification suggestions
  dimension: classification_options {
    type: string
    hidden: yes
    case: {
      when: {
        sql: 1=1 ;;
        label: "None"
      }
      when: {
        sql: 1=1 ;;
        label: "OOM"
      }
      when: {
        sql: 1=1 ;;
        label: "Background Task"
      }
      when: {
        sql: 1=1 ;;
        label: "Shutdown Hang"
      }
    }
  }

# Helper dimension - matches if ANY selected process type is present
  dimension: matches_process_filter {
    type: yesno
    hidden: yes
    sql:
    CASE
      WHEN {% condition process_types_filter %} 'Main' {% endcondition %}
        OR {% condition process_types_filter %} 'Content' {% endcondition %}
        OR {% condition process_types_filter %} 'GMPlugin' {% endcondition %}
        OR {% condition process_types_filter %} 'GPU' {% endcondition %}
        OR {% condition process_types_filter %} 'RDD' {% endcondition %}
        OR {% condition process_types_filter %} 'Socket' {% endcondition %}
        OR {% condition process_types_filter %} 'Utility' {% endcondition %}
      THEN (
        ({% condition process_types_filter %} 'Main' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_MAIN}) != 0) OR
        ({% condition process_types_filter %} 'Content' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_CONTENT}) != 0) OR
        ({% condition process_types_filter %} 'GMPlugin' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_GMPLUGIN}) != 0) OR
        ({% condition process_types_filter %} 'GPU' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_GPU}) != 0) OR
        ({% condition process_types_filter %} 'RDD' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_RDD}) != 0) OR
        ({% condition process_types_filter %} 'Socket' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_SOCKET}) != 0) OR
        ({% condition process_types_filter %} 'Utility' {% endcondition %} AND (${process_types_bitset} & ${PROCESS_TYPE_UTILITY}) != 0)
      )
      ELSE TRUE
    END
  ;;
  }

# Helper dimension - matches if ANY selected classification is present
  dimension: matches_classification_filter {
    type: yesno
    hidden: yes
    sql:
    CASE
      WHEN {% condition classifications_filter %} 'None' {% endcondition %}
        OR {% condition classifications_filter %} 'OOM' {% endcondition %}
        OR {% condition classifications_filter %} 'Background Task' {% endcondition %}
        OR {% condition classifications_filter %} 'Shutdown Hang' {% endcondition %}
      THEN (
        ({% condition classifications_filter %} 'None' {% endcondition %} AND (${classifications_bitset} & ${CLASSIFY_NONE}) != 0) OR
        ({% condition classifications_filter %} 'OOM' {% endcondition %} AND (${classifications_bitset} & ${CLASSIFY_OOM}) != 0) OR
        ({% condition classifications_filter %} 'Background Task' {% endcondition %} AND (${classifications_bitset} & ${CLASSIFY_BACKGROUND_TASK}) != 0) OR
        ({% condition classifications_filter %} 'Shutdown Hang' {% endcondition %} AND (${classifications_bitset} & ${CLASSIFY_SHUTDOWN_HANG}) != 0)
      )
      ELSE TRUE
    END
  ;;
  }

# Combined filter
  dimension: matches_all_filters {
    type: yesno
    hidden: yes
    sql: ${matches_process_filter} AND ${matches_classification_filter} ;;
  }

# Filtered measure
  measure: crashing_users_filtered {
    type: sum
    label: "Crashing Users (Filtered)"
    sql: CASE
         WHEN ${matches_all_filters}
         THEN ${TABLE}.crashing_users
        ELSE 0
        END;;
  }

# Unfiltered measure
  measure: total_crashing_users {
    type: sum
    label: "Total Crashing Users"
    sql: ${TABLE}.crashing_users ;;
    hidden:  yes
  }
  }
