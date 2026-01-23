include: "//looker-hub/firefox_crash_metrics/views/crash_counts_aggregates.view.lkml"

view: +crash_counts_aggregates {
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

  # Base dimensions
  dimension: process_type_bit {
    type: number
    sql: ${TABLE}.process_type_bit ;;
  }

  dimension: classification_bit {
    type: number
    sql: ${TABLE}.classification_bit ;;
  }

  # Single multi-select parameter for process types
  filter: process_type_filter {
    type: string
    label: "Process Type"
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
  filter: classification_filter {
    type: string
    label: "Classification"
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
    {% if process_type_filter._in_query %}
      (
        {% condition process_type_filter %} 'Main' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_MAIN}
      ) OR (
        {% condition process_type_filter %} 'Content' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_CONTENT}
      ) OR (
        {% condition process_type_filter %} 'GMPlugin' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_GMPLUGIN}
      ) OR (
        {% condition process_type_filter %} 'GPU' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_GPU}
      ) OR (
        {% condition process_type_filter %} 'RDD' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_RDD}
      ) OR (
        {% condition process_type_filter %} 'Socket' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_SOCKET}
      ) OR (
        {% condition process_type_filter %} 'Utility' {% endcondition %} AND ${process_type_bit} = ${PROCESS_TYPE_UTILITY}
      )
    {% else %}
      TRUE
    {% endif %}
  ;;
  }

  dimension: matches_classification_filter {
    type: yesno
    hidden: yes
    sql:
    {% if classification_filter._in_query %}
      (
        {% condition classification_filter %} 'None' {% endcondition %} AND ${classification_bit} = ${CLASSIFY_NONE}
      ) OR (
        {% condition classification_filter %} 'OOM' {% endcondition %} AND ${classification_bit} = ${CLASSIFY_OOM}
      ) OR (
        {% condition classification_filter %} 'Background Task' {% endcondition %} AND ${classification_bit} = ${CLASSIFY_BACKGROUND_TASK}
      ) OR (
        {% condition classification_filter %} 'Shutdown Hang' {% endcondition %} AND ${classification_bit} = ${CLASSIFY_SHUTDOWN_HANG}
      )
    {% else %}
      TRUE
    {% endif %}
  ;;
  }

  # Combined filter
  dimension: matches_all_filters {
    type: yesno
    hidden: yes
    sql: ${matches_process_filter} AND ${matches_classification_filter} ;;
  }

  # Filtered measures
  measure: sum_total_crashes {
    type: sum
    label: "Total Crashes (All)"
    sql: CASE
         WHEN ${matches_all_filters}
         THEN ${TABLE}.total_crashes
         ELSE 0
       END ;;
  }

  measure: sum_total_crashes_95percentile {
    type: sum
    label: "Total Crashes (95th Percentile)"
    sql: CASE
         WHEN ${matches_all_filters}
         THEN ${TABLE}.total_95percentile
         ELSE 0
       END ;;
  }

  measure: sum_total_crashes_no_outliers {
    type: sum
    label: "Total Crashes (No Outliers)"
    sql: CASE
         WHEN ${matches_all_filters}
         THEN ${TABLE}.total_no_outliers
         ELSE 0
       END ;;
  }

  # Unfiltered measures (hidden)
  measure: total_crashes_unfiltered {
    type: sum
    label: "Total Crashes (All, Unfiltered)"
    sql: ${TABLE}.total_crashes ;;
    hidden: yes
  }

  measure: total_crashes_95percentile_unfiltered {
    type: sum
    label: "Total Crashes (95th Percentile, Unfiltered)"
    sql: ${TABLE}.total_95percentile ;;
    hidden: yes
  }

  measure: total_crashes_no_outliers_unfiltered {
    type: sum
    label: "Total Crashes (No Outliers, Unfiltered)"
    sql: ${TABLE}.total_no_outliers ;;
    hidden: yes
  }
}
