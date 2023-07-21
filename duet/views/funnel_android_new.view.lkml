view: funnel_android_new {

  derived_table: {
    sql: WITH top AS (
          SELECT
            date,
            Country_region AS country,
            SUM(Store_listing_visitors) AS views,
            SUM(Store_listing_acquisitions) AS downloads
          FROM
            `moz-fx-data-marketing-prod.google_play_store.Store_Performance_country_v1`
          WHERE
            Package_name = 'org.mozilla.firefox'
            AND date >= '2022-01-01'
          GROUP BY 1, 2
        ), first_seen AS (
          SELECT
            c.first_seen_date AS date,
            first_reported_country AS country,
            c.client_id, case when a.client_id is not null then 1 else 0 end as activated
          FROM
            `mozdata.fenix.firefox_android_clients` c
          LEFT JOIN
            (select client_id
            from `moz-fx-data-shared-prod.fenix.new_profile_activation`
            where submission_date >= '2022-01-01' and activated = 1
             ) a
          USING
            (client_id)
          WHERE
            c.first_seen_date >= '2022-01-01'

            AND install_source = 'com.android.vending'
          GROUP BY 1, 2, 3, 4
        )
, retention as (select b.*, mozfun.bits28.retention(days_seen_bits, date_add(b.date, INTERVAL 27 day)).day_27.*
                          , mozfun.bits28.active_in_range(days_seen_bits, -2 + 1, 1) AS seen_on_day_0
                          ,  mozfun.bits28.active_in_range(days_seen_bits, -2 + 2, 2 - 1) AS seen_on_day_1
                FROM mozdata.fenix.clients_last_seen_joined a
                INNER JOIN first_seen b
                USING (client_id)
                 WHERE a.submission_date > '2022-01-01'
                 AND a.submission_date = date_add(b.date, INTERVAL 27 day)
                )
  , new_profile_aggs as (select coalesce(country, "missing") as country, date
                            , count(distinct client_id) new_profiles
                            , sum(activated) as activations
                            , avg(activated) as activation_rate
                         from first_seen
                         group by 1, 2

  )
  , ret_aggs as( select coalesce(country, "missing") as country, date
                      , COUNTIF(active_in_week_0) as  active_in_week_0
                      , COUNTIF(active_in_week_0 AND active_in_week_1) as active_week_1_and_0
                      ,SAFE_DIVIDE(
                                  COUNTIF(active_in_week_0 AND active_in_week_1),
                                  COUNTIF(active_in_week_0)) as retention_week_1
                      , COUNTIF(active_in_week_0 AND active_in_week_3) active_week_3_and_0
                      , SAFE_DIVIDE(
                                  COUNTIF(active_in_week_0 AND active_in_week_3),
                                  COUNTIF(active_in_week_0)) as retention_week_3
                      , COUNTIF(seen_on_day_0) active_on_day_0
                      , COUNTIF(seen_on_day_0 AND seen_on_day_1) active_on_day_1_and_0
                      , SAFE_DIVIDE(
                                  COUNTIF(seen_on_day_0 AND seen_on_day_1),
                                  COUNTIF(seen_on_day_0)) as retention_day_1
                from retention
                --where date = '2023-04-01'
                group by 1, 2
                ) select a.*, b.* except(country, date), c.views, c.downloads
                from  new_profile_aggs a
                left join ret_aggs b
                      on a.date = b.date
                      and a.country = b.country
                left join top c
                      on a.date = c.date
                      and a.country = c.country
  ;;
  }



  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: date {
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

  measure: views {
    description: "The number of users that visited the app listing who didn't already have the app installed on any of their devices"
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: downloads {
    description: "The number of users that visited your Store Listing and installed your app, who did not have your app installed on any device"
    type: sum
    sql: ${TABLE}.downloads ;;
  }

  measure: new_profiles {
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: activations {
    description: "Early indicator for LTV based on days of app open and searches on the first week"
    type: sum
    sql: ${TABLE}.activations ;;
  }

  measure: active_in_week_0 {
    description: "Unique Client IDs thyat were active in their week 0"
    type: sum
    sql: ${TABLE}.active_in_week_0 ;;
  }
  measure: active_week_1_and_0 {
    description: "Unique Client IDs that were active in their week 0 and 1"
    type: sum
    sql: ${TABLE}.active_week_1_and_0 ;;
  }
  measure: active_week_3_and_0 {
    description: "Unique Client IDs that were active in their week 0 and 3"
    type: sum
    sql: ${TABLE}.active_week_3_and_0 ;;
  }
  measure: active_on_day_0 {
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.active_on_day_0 ;;
  }
  measure: active_on_day_1_and_0 {
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.active_on_day_1_and_0 ;;
  }


  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations}/ NULLIF(${new_profiles},0) ;;
  }

  measure: retention_week_1 {
    label: "Week 1 Rention Rate"
    type: number
    value_format_name: percent_2
    sql: ${active_week_1_and_0}/ NULLIF(${active_in_week_0},0) ;;
    }

  measure: retention_week_3 {
    label: "Week 3 Rention Rate"
    type: number
    value_format_name: percent_2
    sql: ${active_week_3_and_0}/ NULLIF(${active_in_week_0},0) ;;
  }

  measure: retention_day_1 {
    label: "1 Day Rention Rate"
    type: number
    value_format_name: percent_2
    sql: ${active_week_3_and_0}/ NULLIF(${active_on_day_0},0) ;;
  }

  filter: current_date {
    type: date
    view_label: "KPI date filter"
    label: "1. Current Date"
    description: "Select the last date of the period you are interested in"
    convert_tz: no
  }


  dimension: day_month {
    description: "this dimension will help us trend well period over period analysis for YoY, MoM and QoQ at daily granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%d", ${TABLE}.date);;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%B", ${TABLE}.date);;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "07" then "Q3"
              ELSE "Q4" end;;
  }

  dimension: filter_end_date {
    type: date
    hidden: yes
    description: "Select the last date of the period you are interested in"
    sql: {% date_end current_date%};;
  }

  parameter: compare_to {
    view_label: "KPI date filter"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date filter"
    label: "2. Compare To:"
    type: unquoted
    # allowed_value: {
    #   label: "Previous Period"
    #   value: "Period"
    # }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }
    default_value: "Year"
  }

  dimension: first_date_in_period {
    description: "For a well defined period (YoY, QoQ, MoM, WoW), we use date trunc to get the period start date, for arbitrary period modify this dimension to use date sub and number of days in period"
    type: date
    hidden: yes
    sql: DATE_TRUNC(${filter_end_date}, {% parameter compare_to %});;
  }

  dimension: period_2_start {
    hidden:  yes
    description: "Calculates the start of the previous period"
    type: date
    sql:
        DATE_SUB(${first_date_in_period}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }

  dimension: period_2_end {
    hidden:  yes
    description: "Calculates the end of the previous period"
    type: date
    sql:
        DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }


  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this to create the measures for the respective periods (this = current period, last = previous period)"
    type: string
    sql:
        {% if current_date._is_filtered %}
            CASE
            WHEN DATE(${TABLE}.date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  measure: current_period_views {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.views ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_views {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.views ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.downloads ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.downloads ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_activations {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activations ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_activations {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activations ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_active_in_week_0 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_in_week_0 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_in_week_0{
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_in_week_0 ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_active_week_1_and_0 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_week_1_and_0 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_week_1_and_0{
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_week_1_and_0 ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_active_week_3_and_0 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_week_3_and_0 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_week_3_and_0{
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_week_3_and_0 ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_active_on_day_0 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_on_day_0 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_on_day_0{
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_on_day_0 ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_active_on_day_1_and_0 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_on_day_1_and_0 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_on_day_1_and_0{
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.active_on_day_1_and_0 ;;
    filters: [period_filtered_measures: "last"]
  }

  }
