view: dau_model {
  derived_table: {
    sql_trigger_value: current_timestamp() ;;
    sql_create:
    DECLARE current_key STRING DEFAULT ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      -- add source or campaign not null as attributed
      -- country tier: FR, GB, US, CA, DE
      """, r"(\(.*\))"), '');

    DECLARE row_count INT64;

    SET row_count = (
      SELECT COUNT(*)
      FROM mozdata.analysis.dou_forecasts
      WHERE key = current_key);

    IF row_count = 0 THEN
      -- Create model
      CREATE OR REPLACE MODEL
      ${SQL_TABLE_NAME} OPTIONS(
        model_type='ARIMA',
        time_series_data_col='dau',
        time_series_timestamp_col='submission_date'
      ) AS
      SELECT
        submission_date,
        dau
      FROM
        ${firefox_desktop_usage_2021.SQL_TABLE_NAME}
      WHERE
        submission_date < '2021-01-19';
    END IF; ;;
  }
}

view: new_profiles_model {
  derived_table: {
    sql_trigger_value: current_timestamp() ;;
    sql_create:
    DECLARE current_key STRING DEFAULT ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '');

    DECLARE row_count INT64;

    SET row_count = (
      SELECT COUNT(*)
      FROM mozdata.analysis.dou_forecasts
      WHERE key = current_key);

    IF row_count = 0 THEN
      CREATE OR REPLACE MODEL
      ${SQL_TABLE_NAME} OPTIONS(
        model_type='ARIMA',
        time_series_data_col='new_profiles',
        time_series_timestamp_col='submission_date'
      ) AS
      SELECT
        submission_date,
        new_profiles
      FROM
        ${firefox_desktop_usage_2021.SQL_TABLE_NAME}
      WHERE
        submission_date < '2021-01-19';
    END IF; ;;
  }
}

view: insert_stmnt {
  derived_table: {
    sql_trigger_value: current_timestamp() ;;
    sql_create:
      DECLARE current_key STRING DEFAULT ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '');

      DECLARE row_count INT64;

      SET row_count = (
        SELECT COUNT(*)
        FROM mozdata.analysis.dou_forecasts
        WHERE key = current_key);

      IF row_count = 0 THEN

      INSERT INTO mozdata.analysis.dou_forecasts_cache
      WITH historic_data AS (
        SELECT
          CAST(submission_date AS TIMESTAMP) AS submission_date,

          CAST(dau AS FLOAT64) AS dau_forecast,
          CAST(NULL AS FLOAT64) AS dau_target,
          CAST(NULL AS FLOAT64) AS dau_forecast_lower,
          CAST(NULL AS FLOAT64) AS dau_forecast_upper,

          CAST(new_profiles AS FLOAT64) AS new_profiles_forecast,
          CAST(NULL AS FLOAT64) AS new_profiles_target,
          CAST(NULL AS FLOAT64) AS new_profiles_forecast_lower,
          CAST(NULL AS FLOAT64) AS new_profiles_forecast_upper,
        FROM
          ${firefox_desktop_usage_2021.SQL_TABLE_NAME}
        WHERE
          submission_date BETWEEN '2021-01-01' AND '2021-01-18'
      ), predicted_data AS (
        SELECT
          forecast_timestamp AS submission_date,

          dau.forecast_value AS dau_forecast,
          dau.forecast_value * 1.05 AS dau_target,
          dau.prediction_interval_lower_bound AS dau_forecast_lower,
          dau.prediction_interval_upper_bound AS dau_forecast_upper,

          np.forecast_value AS new_profiles_forecast,
          np.forecast_value * 1.05 AS new_profiles_target,
          np.prediction_interval_lower_bound AS new_profiles_forecast_lower,
          np.prediction_interval_upper_bound AS new_profiles_forecast_upper,
        FROM
          ML.FORECAST(MODEL ${dau_model.SQL_TABLE_NAME},
            STRUCT(365 AS horizon,
            0.8 AS confidence_level)) AS dau
        JOIN
          ML.FORECAST(MODEL ${new_profiles_model.SQL_TABLE_NAME},
            STRUCT(365 AS horizon,
            0.8 AS confidence_level)) AS np
          USING (forecast_timestamp)
      )
      SELECT
        current_key AS key,
        submission_date,

        dau_forecast,
        dau_target,
        SUM(dau_forecast) OVER (ORDER BY submission_date ASC) AS cdou_forecast,
        (SUM(dau_forecast) OVER (ORDER BY submission_date ASC)) * 1.05 AS cdou_target,
        dau_forecast_lower,
        dau_forecast_upper,

        new_profiles_forecast,
        new_profiles_target,
        SUM(new_profiles_forecast) OVER (ORDER BY submission_date ASC) AS cum_new_profiles_forecast,
        (SUM(new_profiles_forecast) OVER (ORDER BY submission_date ASC)) * 1.05 AS cum_new_profiles_target,
        new_profiles_forecast_lower,
        new_profiles_forecast_upper,

      FROM
        (SELECT * FROM historic_data UNION ALL SELECT * FROM predicted_data);
      END IF; ;;
  }
}

view: prediction {
  derived_table: {
    sql:
    SELECT
      *
    FROM
      mozdata.analysis.dou_forecasts
    WHERE -- Also requires ${insert_stmnt.SQL_TABLE_NAME}
      key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '');;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: cdou_forecast {
    type: number
    sql: ANY_VALUE(${TABLE}.cdou_forecast) ;;
  }

  measure: cdou_target {
    type: number
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
  }

  measure: cum_new_profiles_forecast {
    type: number
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_forecast) ;;
  }

  measure: cum_new_profiles_target {
    type: number
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_target) ;;
  }

  measure: dau_forecast {
    type: number
    sql: ANY_VALUE(${TABLE}.dau_forecast) ;;
  }

  measure: dau_forecast_lower {
    type: number
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower) ;;
  }

  measure: dau_forecast_upper {
    type: number
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper) ;;
  }

  measure: dau_target {
    type: number
    sql: ANY_VALUE(${TABLE}.dau_target) ;;
  }

  measure: new_profiles_forecast {
    type: number
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast) ;;
  }

  measure: new_profiles_forecast_lower {
    type: number
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower) ;;
  }

  measure: new_profiles_forecast_upper {
    type: number
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper) ;;
  }

  measure: new_profiles_target {
    type: number
    sql: ANY_VALUE(${TABLE}.new_profiles_target) ;;
  }

  measure: recent_cum_new_profiles_forecast {
    type: max
    sql: ${TABLE}.cum_new_profiles_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_cum_new_profiles_target {
    type: max
    sql: ${TABLE}.cum_new_profiles_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_cdou_forecast {
    type: max
    sql: ${TABLE}.cdou_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_cdou_target {
    type: max
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }
}
