view: ctd_cohort_analysis_desktop {


  derived_table: {
    sql:
    SELECT
        first_seen_date,
      CASE
          WHEN attribution_campaign = "ctd-de" THEN "ctd-de"
          WHEN (attribution_source IS NOT NULL) AND (attribution_campaign != "ctd-de") THEN "other_attributed" --the second bit isnt strictly necessary.
          ELSE "unattributed"
        END AS benchmark_filter,attribution_source, attribution_medium, attribution_content,
        SAFE_DIVIDE(DATE_DIFF(submission_date, first_seen_date, DAY) + 1, 7) AS period,
        SUM(num_clients_in_cohort) AS num_in_cohort,
        SUM(num_clients_active_atleastonce_in_last_7_days) AS num_clients_active_atleastonce_in_last_7_days
    FROM `moz-fx-data-shared-prod.telemetry_derived.desktop_cohort_daily_retention_v1`
    WHERE MOD(DATE_DIFF(submission_date, first_seen_date, DAY) + 1, 7) = 0
    AND submission_date >= DATE(2023, 1, 1)
    AND first_seen_date >= DATE(2023, 1, 1)
    AND country = 'DE'
    AND normalized_os LIKE 'Windows%'
    AND normalized_channel = 'release'
    GROUP BY 1,2,3, 4, 5, 6
        ;;
  }

  dimension: attribution_source {
    type: string
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: attribution_medium {
    type: string
    sql: ${TABLE}.attribution_medium ;;
  }
  dimension: attribution_content {
    type: string
    sql: ${TABLE}.attribution_content ;;
  }

  dimension: benchmark_filter {
    description: "Groupings to compare ctd to other benchmark cohort"
    type: string
    sql:${TABLE}.benchmark_filter
      ;;
  }

  dimension_group: cohort_date {
    type: time
    datatype: date
    timeframes: [date]
    sql: ${TABLE}.first_seen_date ;;
    convert_tz: no
  }

  dimension: weeks_since_seen {
    description: "Groupings to compare ctd to other benchmark cohort"
    type: number
    sql:${TABLE}.period
      ;;
  }

  measure: num_in_cohort {
    description: "total number of clients in cohort"
    type: sum
    sql: ${TABLE}.num_in_cohort ;;
  }

  measure: num_clients_active_atleastonce_in_last_7_days {
    description: "number of clients that visited atleast once in a given week"
    type: sum
    sql: ${TABLE}.num_clients_active_atleastonce_in_last_7_days ;;
  }

}
