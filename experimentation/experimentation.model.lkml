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


view: +experiment_cumulative_ad_clicks {
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

view: +experiment_cumulative_search_count {
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

view: +experiment_cumulative_search_with_ads_count {
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

view: +experiment_enrollment_other_events_overall {
  dimension: experiment {
    suggest_explore: experimenter_experiments
    suggest_dimension: experimenter_experiments.normandy_slug
  }

  dimension: timestamp {
    type: date_time
    sql: CASE
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) BETWEEN 5 AND 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), HOUR)
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) >= 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), DAY)
        ELSE TIMESTAMP(${time_time})
      END;;
  }

  measure: Total {
    type: number
    sql: SUM(${value}) ;;
  }

  filter: timeframe {
    type: date
  }
}

view: +experiment_enrollment_overall {
  dimension: experiment {
    suggest_explore: experimenter_experiments
    suggest_dimension: experimenter_experiments.normandy_slug
  }

  dimension: timestamp {
    type: date_time
    sql: CASE
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) BETWEEN 5 AND 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), HOUR)
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) >= 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), DAY)
        ELSE TIMESTAMP(${time_time})
      END;;
  }

  measure: Total {
    type: number
    sql: SUM(${value}) ;;
  }

  filter: timeframe {
    type: date
  }
}

view: +experiment_unenrollment_overall {
  dimension: experiment {
    suggest_explore: experimenter_experiments
    suggest_dimension: experimenter_experiments.normandy_slug
  }

  dimension: timestamp {
    type: date_time
    sql: CASE
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) BETWEEN 5 AND 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), HOUR)
        WHEN DATE_DIFF(DATE({% date_end timeframe %}), DATE({% date_start timeframe %}), DAY) >= 30 THEN TIMESTAMP_TRUNC(TIMESTAMP(${time_time}), DAY)
        ELSE TIMESTAMP(${time_time})
      END;;
  }

  measure: Total {
    type: number
    sql: SUM(${value}) ;;
  }

  filter: timeframe {
    type: date
  }
}

explore: experiment_cumulative_ad_clicks {
  sql_always_where:
        ${branch} IS NOT NULL AND
    {% condition experiment_cumulative_ad_clicks.timeframe %} TIMESTAMP(${time_time}) {% endcondition %} AND
    ((EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_cumulative_ad_clicks.timeframe %}), DATE({% date_start experiment_cumulative_ad_clicks.timeframe %}), DAY) BETWEEN 5 AND 30) OR
     (EXTRACT(HOUR FROM TIMESTAMP(${time_time})) = 0 AND EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_cumulative_ad_clicks.timeframe %}), DATE({% date_start experiment_cumulative_ad_clicks.timeframe %}), DAY) >= 30) OR
     DATE_DIFF(DATE({% date_end experiment_cumulative_ad_clicks.timeframe %}), DATE({% date_start experiment_cumulative_ad_clicks.timeframe %}), DAY) < 5) ;;
}

explore: experiment_cumulative_search_count {
  sql_always_where:
  ${branch} IS NOT NULL AND
  {% condition experiment_cumulative_search_count.timeframe %} TIMESTAMP(${time_time}) {% endcondition %} AND
  ((EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_count.timeframe %}), DATE({% date_start experiment_cumulative_search_count.timeframe %}), DAY) BETWEEN 5 AND 30) OR
  (EXTRACT(HOUR FROM TIMESTAMP(${time_time})) = 0 AND EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_count.timeframe %}), DATE({% date_start experiment_cumulative_search_count.timeframe %}), DAY) >= 30) OR
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_count.timeframe %}), DATE({% date_start experiment_cumulative_search_count.timeframe %}), DAY) < 5) ;;
}

explore: experiment_cumulative_search_with_ads_count {
  sql_always_where:
  ${branch} IS NOT NULL AND
  {% condition experiment_cumulative_search_with_ads_count.timeframe %} TIMESTAMP(${time_time}) {% endcondition %} AND
  ((EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_with_ads_count.timeframe %}), DATE({% date_start experiment_cumulative_search_with_ads_count.timeframe %}), DAY) BETWEEN 5 AND 30) OR
  (EXTRACT(HOUR FROM TIMESTAMP(${time_time})) = 0 AND EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_with_ads_count.timeframe %}), DATE({% date_start experiment_cumulative_search_with_ads_count.timeframe %}), DAY) >= 30) OR
  DATE_DIFF(DATE({% date_end experiment_cumulative_search_with_ads_count.timeframe %}), DATE({% date_start experiment_cumulative_search_with_ads_count.timeframe %}), DAY) < 5) ;;
}

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

explore: experiment_enrollment_other_events_overall {
  sql_always_where:
  ${branch} IS NOT NULL AND
  {% condition experiment_enrollment_other_events_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;
}

explore: experiment_enrollment_overall {
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_enrollment_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;
}

explore: experiment_unenrollment_overall {
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_unenrollment_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;
}

explore: logs {}

explore: query_cost {}

explore: task_monitoring_logs {}

explore: task_profiling_logs {}

explore: experimenter_experiments {}
