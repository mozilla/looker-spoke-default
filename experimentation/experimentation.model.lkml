connection: "telemetry"
label: "Experimentation"
include: "//looker-hub/experimentation/views/experiment_enrollment_cumulative_population_estimate.view.lkml"
include: "//looker-hub/experimentation/views/experiment_enrollment_daily_active_population.view.lkml"
include: "//looker-hub/experimentation/views/experiment_enrollment_other_events_overall.view.lkml"
include: "//looker-hub/experimentation/views/experiment_enrollment_overall.view.lkml"
include: "//looker-hub/experimentation/views/experiment_unenrollment_overall.view.lkml"
include: "//looker-hub/experimentation/views/experimenter_experiments.view.lkml"
include: "//looker-hub/experimentation/views/logs.view.lkml"
include: "//looker-hub/experimentation/views/query_cost.view.lkml"
include: "//looker-hub/experimentation/views/task_monitoring_logs.view.lkml"
include: "//looker-hub/firefox_desktop/views/events.view.lkml"
include: "views/analysis_aggregates.view.lkml"
include: "views/analysis_enrollments.view.lkml"
include: "views/analysis_statistics.view.lkml"
include: "views/enrollment_status.view.lkml"
include: "views/preview.view.lkml"
include: "views/preview_logs.view.lkml"
include: "views/sample_ratio_mismatch.view.lkml"
include: "explores/*"
include: "dashboards/*"

# View customizations

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
    suggest_dimension: experimenter_experiments.normandy_slug
    suggest_explore: experimenter_experiments
  }

  measure: Total {
    type: number
    sql: SUM(${value});;
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



# Explores

explore: experiment_enrollment_cumulative_population_estimate {
  hidden: yes
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_enrollment_cumulative_population_estimate.timeframe %} TIMESTAMP(${time_time}) {% endcondition %} AND
    ((EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) BETWEEN 5 AND 30) OR
     (EXTRACT(HOUR FROM TIMESTAMP(${time_time})) = 0 AND EXTRACT(MINUTE FROM TIMESTAMP(${time_time})) = 0 AND
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) >= 30) OR
     DATE_DIFF(DATE({% date_end experiment_enrollment_cumulative_population_estimate.timeframe %}), DATE({% date_start experiment_enrollment_cumulative_population_estimate.timeframe %}), DAY) < 5) ;;
}

explore: experiment_enrollment_other_events_overall {
  hidden: yes
  sql_always_where:
  ${branch} IS NOT NULL AND
  {% condition experiment_enrollment_other_events_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;

  join: experimenter_experiments {
    type: full_outer
    sql_on: ${experiment_enrollment_other_events_overall.experiment} = ${experimenter_experiments.normandy_slug} ;;
    relationship: many_to_one
  }
}

explore: experiment_enrollment_overall {
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_enrollment_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;

  join: experimenter_experiments {
    type: full_outer
    sql_on: ${experiment_enrollment_overall.experiment} = ${experimenter_experiments.normandy_slug} ;;
    relationship: many_to_one
  }
}

explore: experiment_unenrollment_overall {
  sql_always_where:
    ${branch} IS NOT NULL AND
    {% condition experiment_unenrollment_overall.timeframe %} TIMESTAMP(${time_time}) {% endcondition %};;

  join: experimenter_experiments {
    type: full_outer
    sql_on: ${experiment_unenrollment_overall.experiment} = ${experimenter_experiments.normandy_slug} ;;
    relationship: many_to_one
  }
}

explore: experiment_enrollment_daily_active_population {
  join: experimenter_experiments {
    type: full_outer
    sql_on: ${experiment_enrollment_daily_active_population.experiment} = ${experimenter_experiments.normandy_slug} ;;
    relationship: many_to_one
  }
}

view: +events {
  dimension: reason {
    type: string
    sql: mozfun.map.get_key(event_map_values, 'reason') ;;
  }
}

explore: unenrollment_reasons {
  view_name: events
  hidden: yes

  sql_always_where:
    ${events.event_method} LIKE "unenroll%" AND
    ${events.event_category} = "normandy";;

    always_filter: {
      filters: [
        events.submission_date: "7 days"
      ]
    }
  }

  explore: enrollment_status {
    hidden: yes
  }

  explore: sample_ratio_mismatch {
    hidden: yes
  }

  explore: logs {
    hidden: yes
  }

  explore: query_cost {
    hidden: yes
  }

  explore: task_monitoring_logs {
    hidden: yes
  }

  explore: experimenter_experiments {}

  explore: +preview {
    join: experimenter_experiments {
      type: full_outer
      relationship: many_to_one
      sql_on: ${preview.normalized_slug} LIKE CONCAT("%", REPLACE(${experimenter_experiments.normandy_slug}, "-", "_"), "%")  ;;
    }
  }

  explore: analysis_statistics {
    always_filter: {
      filters: [
        analysis_statistics.analysis_period: "daily",
        analysis_statistics.slug: ""
      ]
    }
  }

  explore: analysis_aggregates {
    always_filter: {
      filters: [
        analysis_aggregates.slug: "",
        analysis_aggregates.analysis_basis: "enrollments",
        analysis_aggregates.window_index: "1",
        analysis_aggregates.analysis_period: "day",
        analysis_aggregates.metric: ""
      ]
    }
  }

  explore: analysis_enrollments {
    always_filter: {
      filters: [
        analysis_enrollments.slug: ""
      ]
    }
  }
