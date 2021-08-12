view: mobile_dau_actuals {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    sql:
      with
        base as (
          SELECT
            submission_date AS date,
            campaign,
            country_name,
            os,
            distribution_id,
            CASE WHEN app_name IN ('fennec', 'fenix') THEN 'fennec_fenix' ELSE app_name END AS app_name,
            CASE WHEN canonical_app_name IN ('Firefox for Android (Fennec)', 'Firefox for Android (Fenix)') THEN 'Firefox for Android (Fennec + Fenix)' ELSE canonical_app_name END AS canonical_app_name,
            SUM(dau) AS dau,
            SUM(cdou) AS cdou
          FROM `mozdata.telemetry.mobile_usage_2021`
          WHERE app_name IN ('firefox_ios', 'fennec', 'fenix', 'focus_android', 'focus_ios')
          GROUP BY 1,2,3,4,5,6,7
        )

      SELECT
        *,
        AVG(dau) OVER window_7day as dau_7day_ma
      FROM base
      WINDOW window_7day AS (PARTITION BY
        campaign,
        country_name,
        os,
        distribution_id,
        app_name,
        canonical_app_name
      ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW);;
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

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
    hidden: yes
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.date, ${TABLE}.app_name) ;;
    hidden: yes
  }

  dimension: canonical_app_name {
    type: string
    sql: ${TABLE}.canonical_app_name ;;
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

  dimension: os {
    label: "OS"
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: distribution_id {
    label: "Distribution ID"
    type: string
    sql: ${TABLE}.distribution_id ;;
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

  # measure: cdou_delta_from_forecast_year {
  #   label: "CDOU: Relative Delta from Year KPI Target"
  #   type: number
  #   value_format: "0.000%"
  #   sql: (${cdou_year} / ${original_mobile_forecast.cdou_forecast_year} ) - 1 ;;
  #   description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU for the Year."
  # }

  # measure: delta_from_target_year {
  #   label: "CDOU: Relative Delta from Year Stretch Goal"
  #   type: number
  #   value_format: "0.000%"
  #   sql: (${cdou_year} / (${original_mobile_forecast.cdou_target_year}) ) - 1 ;;
  #   description: "Relative (given as a fraction) difference between actual CDOU and targeted CDOU."
  # }

  # measure: delta_from_target_count_year {
  #   label: "CDOU: Absolute Delta from Year Stretch Goal"
  #   type: number
  #   value_format: "#,##0"
  #   sql: ${cdou_year} - ${original_mobile_forecast.cdou_target_year} ;;
  #   description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  # }

  # measure: delta_from_forecast_count_year {
  #   label: "CDOU: Absolute Delta from Year KPI Target"
  #   type: number
  #   value_format: "#,##0"
  #   sql: ${cdou_year} - ${original_mobile_forecast.cdou_forecast_year}  ;;
  #   description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  # }

  # YoY

}
