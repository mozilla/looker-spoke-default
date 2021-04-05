view: mobile_dau_model {
  derived_table: {
    sql_trigger_value: current_timestamp() ;;
    sql_create:
    DECLARE current_key STRING DEFAULT ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
      {% condition mobile_usage_2021.channel %} channel {% endcondition %}
      {% condition mobile_usage_2021.country %} country {% endcondition %}
      {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
      {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition mobile_usage_2021.os %} os {% endcondition %}
      -- add source or campaign not null as attributed
      -- country tier: FR, GB, US, CA, DE
      """, r"(\(.*\))"), '');

    DECLARE row_count INT64;

    SET row_count = (
      SELECT COUNT(*)
      FROM mozdata.analysis.mobile_dou_forecasts
      WHERE key = current_key);

    IF row_count = 0 THEN
      -- Create model
      CREATE OR REPLACE MODEL
      ${SQL_TABLE_NAME} OPTIONS(
        model_type='ARIMA',
        time_series_data_col='dau',
        time_series_id_col='app_name',
        time_series_timestamp_col='submission_date'
      ) AS
      SELECT
        submission_date,
        app_name,
        dau
      FROM
        ${mobile_usage_2021.SQL_TABLE_NAME}
      WHERE
        submission_date < '2021-01-19';
    END IF; ;;
  }
}

view: mobile_insert_stmnt {
  derived_table: {
    sql_trigger_value: current_timestamp() ;;
    sql_create:
      DECLARE current_key STRING DEFAULT ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
      {% condition mobile_usage_2021.channel %} channel {% endcondition %}
      {% condition mobile_usage_2021.country %} country {% endcondition %}
      {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
      {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition mobile_usage_2021.os %} os {% endcondition %}
      """, r"(\(.*\))"), '');

      DECLARE row_count INT64;

      SET row_count = (
        SELECT COUNT(*)
        FROM mozdata.analysis.mobile_dou_forecasts
        WHERE key = current_key);

      IF row_count = 0 THEN
      INSERT INTO mozdata.analysis.mobile_dou_forecasts_cache
      WITH target_lifts AS (
        SELECT
            DISTINCT app_name, target_lift
        FROM `moz-fx-data-shared-prod.static.mobile_forecasts_official_2021`
      ), historic_data AS (
        SELECT
          CAST(submission_date AS TIMESTAMP) AS submission_date,
          CAST(app_name AS STRING) AS app_name,
          CAST(dau AS FLOAT64) AS dau_forecast,
          CAST(dau AS FLOAT64) AS dau_forecast_lower,
          CAST(dau AS FLOAT64) AS dau_forecast_upper
        FROM
          ${mobile_usage_2021.SQL_TABLE_NAME}
        WHERE submission_date BETWEEN '2021-01-01' AND '2021-01-18'
      ), predicted_data AS (
        SELECT
          forecast_timestamp AS submission_date,
          dau_model.app_name,
          dau_model.forecast_value AS dau_forecast,
          dau_model.prediction_interval_lower_bound AS dau_forecast_lower,
          dau_model.prediction_interval_upper_bound AS dau_forecast_upper
        FROM
          ML.FORECAST(MODEL ${mobile_dau_model.SQL_TABLE_NAME},
            STRUCT(365 AS horizon,
            0.8 AS confidence_level)) AS dau_model
      ), unioned AS (
        SELECT
          submission_date,
          app_name,
          dau_forecast,
          dau_forecast_lower,
          dau_forecast_upper
        FROM
          (SELECT * FROM historic_data UNION ALL SELECT * FROM predicted_data)
      )
      SELECT
        current_key AS key,
        unioned.submission_date,
        unioned.app_name,
        unioned.dau_forecast,
        dau_forecast * (COALESCE(1 + target_lift, 1.0)) AS dau_target,
        SUM(dau_forecast) OVER (PARTITION BY unioned.app_name ORDER BY submission_date ASC) AS cdou_forecast,
        SUM(dau_forecast * (COALESCE(1 + target_lift, 1.0))) OVER (PARTITION BY unioned.app_name ORDER BY submission_date ASC) AS cdou_target,
        unioned.dau_forecast_lower,
        unioned.dau_forecast_upper
      FROM unioned
      LEFT JOIN target_lifts
      ON unioned.app_name = target_lifts.app_name;
      END IF; ;;
  }
}

view: mobile_prediction {
  derived_table: {
    sql:
    SELECT
      *,
      avg(dau_forecast) over window_7day AS dau_forecast_7day_ma,
      avg(dau_target) over window_7day as dau_target_7day_ma,
      avg(dau_forecast_lower) over window_7day as dau_forecast_lower_7day_ma,
      avg(dau_forecast_upper) over window_7day as dau_forecast_upper_7day_ma
    FROM
      mozdata.analysis.mobile_dou_forecasts
    WHERE -- Also requires ${mobile_insert_stmnt.SQL_TABLE_NAME}
      key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
      {% condition mobile_usage_2021.channel %} channel {% endcondition %}
      {% condition mobile_usage_2021.country %} country {% endcondition %}
      {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
      {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition mobile_usage_2021.os %} os {% endcondition %}
      """, r"(\(.*\))"), '')
    WINDOW window_7day AS (partition by app_name order by submission_date rows between 6 preceding and current row);;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: cdou_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_forecast) ;;
  }

  measure: cdou_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
  }

  measure: dau_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast) ;;
  }

  measure: dau_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_7day_ma) ;;
  }

  measure: dau_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target) ;;
  }

  measure: dau_target_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target_7day_ma) ;;
  }

  measure: dau_forecast_lower {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower) ;;
  }

  measure: dau_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower_7day_ma) ;;
  }

  measure: dau_forecast_upper {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper) ;;
  }

  measure: dau_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper_7day_ma) ;;
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cdou_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_cdou_target {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }
}
