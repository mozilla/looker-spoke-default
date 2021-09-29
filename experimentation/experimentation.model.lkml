connection: "telemetry"
label: "Experimentation"
include: "//looker-hub/experimentation/views/*"

# todo: mark explores as hidden

view: +experiment_enrollment_daily_active_population {
  dimension: experiment {
    suggest_explore: experimenter_experiments
    suggest_dimension: experimenter_experiments.normandy_slug
  }

  measure: Total {
    type: number
    sql: SUM(${value}) ;;
  }
}

view: +experiment_enrollment_cumulative_population_estimate {
  dimension: experiment {
    suggest_explore: experimenter_experiments
    suggest_dimension: experimenter_experiments.normandy_slug
  }

  measure: Total {
    type: number
    sql: SUM(${value}) ;;
  }

  filter: timeframe {
    type: date
  }
}


explore: experiment_cumulative_ad_clicks {}

explore: experiment_cumulative_search_count {}

explore: experiment_cumulative_search_with_ads_count {}

explore: experiment_enrollment_cumulative_population_estimate {
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_enrollment_cumulative_population_estimate.timeframe %} TIMESTAMP(${time_time}) {% endcondition %} AND
    ((EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) BETWEEN 5 AND 30) OR
     (EXTRACT(HOUR FROM TIMESTAMP(${time_time})) = 0 AND EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) >= 30) OR
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) < 5) ;;
}

explore: experiment_enrollment_daily_active_population {}

explore: experiment_enrollment_other_events_overall {}

explore: experiment_enrollment_overall {}

explore: experiment_unenrollment_overall {}

explore: logs {}

explore: query_cost {}

explore: task_monitoring_logs {}

explore: task_profiling_logs {}

explore: experimenter_experiments {}
