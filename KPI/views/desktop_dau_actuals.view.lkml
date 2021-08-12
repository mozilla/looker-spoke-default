view: desktop_dau_actuals {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    sql:
        WITH base AS (
          SELECT
            submission_date AS date,
            activity_segment,
            attributed,
            campaign,
            country_name,
            medium,
            os,
            source,
            SUM(dau) AS dau,
            SUM(cdou) AS cdou,
            SUM(new_profiles) AS new_profiles,
            SUM(cumulative_new_profiles) AS cumulative_new_profiles
          FROM `mozdata.telemetry.firefox_desktop_usage_2021`
          GROUP BY 1,2,3,4,5,6,7,8
          ORDER BY 1
        )

      SELECT
        *,
        AVG(dau) OVER window_7day AS dau_7day_ma,
        AVG(new_profiles) OVER window_7day AS new_profiles_7day_ma
      FROM base
      WINDOW window_7day AS (PARTITION BY
        activity_segment,
        attributed,
        campaign,
        country_name,
        medium,
        os,
        source ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW);;
  }

  dimension_group: date_parts {
    type: time
    timeframes: [day_of_year, week_of_year, week, month_name, month_num, quarter, quarter_of_year, year]
    sql: ${TABLE}.date ;;
    datatype: date
    convert_tz: no
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  dimension: activity_segment {
    label: "User Segment"
    type: string
    sql: ${TABLE}.activity_segment ;;
  }

  dimension: attributed {
    label: "Attribution"
    description: "FKA Light Funnel / Dark Funnel (Unattributed)"
    type: yesno
    sql: ${TABLE}.attributed ;;
  }

  dimension: campaign {
    label: "UTM Campaign"
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: country_name {
    label: "Country"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: medium {
    label: "UTM Medium"
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: os {
    label: "OS"
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: source {
    label: "UTM Source"
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: cdou_year {
    type: sum
    label: "CDOU For Year"
    description: "Starts Counting on Jan 1st of Each Year"
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou ;;
  }

  measure: cdou {
    type: running_total
    label: "CDOU"
    description: "Starts Counting on the First Day of Result"
    value_format: "0.00,,, \"Billion\""
    sql: SUM(${TABLE}.dau) ;;
  }

  measure: cumulative_new_profiles_year {
    type: sum
    label: "Cumulative New Profiles For Year"
    description: "Starts Counting on Jan 1st of Each Year"
    sql: ${TABLE}.cumulative_new_profiles ;;
    hidden: yes
  }

  measure: cumulative_new_profiles {
    type: running_total
    label: "Cumulative New Profiles"
    description: "Starts Counting on the First Day of Result"
    sql: SUM(${TABLE}.cumulative_new_profiles) ;;
    hidden: yes
  }

  measure: dau {
    type: sum
    label: "DAU"
    description: "Daily Active Users"
    sql: ${TABLE}.dau ;;
  }

  measure: dau_7day_ma {
    type: sum
    label: "DAU (Moving Average)"
    sql: ${TABLE}.dau_7day_ma ;;
  }

  measure: new_profiles {
    type: sum
    label: "New Profiles"
    sql: ${TABLE}.new_profiles ;;
    hidden: yes
  }

  measure: new_profiles_7day_ma {
    type: sum
    label: "New Profiles (Moving Average)"
    sql: ${TABLE}.new_profiles_7day_ma ;;
    hidden: yes
  }

  measure: cdou_delta_from_forecast_year {
    label: "CDOU: Relative Delta from Year KPI Target"
    type: number
    value_format: "0.000%"
    sql: (${cdou_year} / ${original_desktop_forecast.cdou_forecast_year} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU for the Year."
  }

  measure: delta_from_target_year {
    label: "CDOU: Relative Delta from Year Stretch Goal"
    type: number
    value_format: "0.000%"
    sql: (${cdou_year} / (${original_desktop_forecast.cdou_target_year}) ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_target_count_year {
    label: "CDOU: Absolute Delta from Year Stretch Goal"
    type: number
    value_format: "#,##0"
    sql: ${cdou_year} - ${original_desktop_forecast.cdou_target_year} ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_forecast_count_year {
    label: "CDOU: Absolute Delta from Year KPI Target"
    type: number
    value_format: "#,##0"
    sql: ${cdou_year} - ${original_desktop_forecast.cdou_forecast_year}  ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  }

  # YoY

}
