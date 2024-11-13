view: ctd_cohort_analysis_mobile {

  #base table https://console.cloud.google.com/bigquery?sq=470293616514:eee95f9ddd584b54bc3e7e4d068f135a

    derived_table: {
      sql:
    SELECT
        cohort_date,
        benchmark_filter,ad_group_name,
        SAFE_DIVIDE(DATE_DIFF(activity_date, cohort_date, DAY) + 1, 7) AS period,
        SUM(num_in_cohort) AS num_in_cohort,
        SUM(num_clients_active_atleastonce_in_last_7_days) AS num_clients_active_atleastonce_in_last_7_days
    FROM `mozdata.analysis.cohort_ctd`
    GROUP BY 1,2,3, 4
        ;;
    }

    dimension: ad_group_name {
      type: string
      sql: ${TABLE}.ad_group_name ;;
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
    sql: ${TABLE}.cohort_date ;;
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
