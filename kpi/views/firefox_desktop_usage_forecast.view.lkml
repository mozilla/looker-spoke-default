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
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
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
    DECLARE data ARRAY<STRUCT<dau INT64, submission_date DATE>>;

    SET row_count = (
      SELECT COUNT(*)
      FROM mozdata.analysis.dou_forecasts
      WHERE key = current_key);

    IF row_count = 0 THEN
      SET data = ARRAY(
        SELECT AS STRUCT
          dau,
          submission_date,
        FROM
          ${firefox_desktop_usage_2021.SQL_TABLE_NAME}
        WHERE
          submission_date < '2021-01-19'
      );

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
        UNNEST(data);
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
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '');

    DECLARE row_count INT64;
    DECLARE data ARRAY<STRUCT<new_profiles INT64, submission_date DATE>>;

    SET row_count = (
      SELECT COUNT(*)
      FROM mozdata.analysis.dou_forecasts
      WHERE key = current_key);

    IF row_count = 0 THEN
      SET data = ARRAY(
        SELECT AS STRUCT
          new_profiles,
          submission_date,
        FROM
          ${firefox_desktop_usage_2021.SQL_TABLE_NAME}
        WHERE
          submission_date < '2021-01-19'
      );

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
        UNNEST(data);
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
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
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
      *,
      AVG(dau_forecast) OVER window_7day AS dau_forecast_7day_ma,
      avg(dau_target) over window_7day as dau_target_7day_ma,
      avg(dau_forecast_lower) over window_7day as dau_forecast_lower_7day_ma,
      avg(dau_forecast_upper) over window_7day as dau_forecast_upper_7day_ma,
      avg(new_profiles_forecast) over window_7day as new_profiles_forecast_7day_ma,
      avg(new_profiles_target) over window_7day as new_profiles_target_7day_ma,
      avg(new_profiles_forecast_lower) over window_7day as new_profiles_forecast_lower_7day_ma,
      avg(new_profiles_forecast_upper) over window_7day as new_profiles_forecast_upper_7day_ma
    FROM
      mozdata.analysis.dou_forecasts
    WHERE
      key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '')
    WINDOW window_7day AS (order by submission_date rows between 6 preceding and current row);;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
    hidden: yes
  }

  measure: cdou_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_forecast) ;;
    description: "Forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cdou_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
    description: "Targeted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cum_new_profiles_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_forecast) ;;
    description: "Forecasted value for Cumulative New Profiles. Only relevant for 2021."
  }

  measure: cum_new_profiles_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_target) ;;
    description: "Targeted value for Cumulative New Profiles. Only relevant for 2021."
  }

  measure: dau_forecast {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast ;;
    description: "Forecasted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_7day_ma) ;;
    hidden: yes
  }

  measure: dau_forecast_lower {
    label: "DAU Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower) ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower_7day_ma) ;;
    hidden: yes
  }

  measure: dau_forecast_upper {
    label: "DAU Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper) ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper_7day_ma) ;;
    hidden: yes
  }

  measure: dau_target {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_target ;;
    description: "Targeted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_target_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast) ;;
    description: "Forecasted value for New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_lower {
    label: "New Profiles Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower) ;;
    description: "Lower bound (10th percentile) value for Forecasted New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_upper {
    label: "New Profiles Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper) ;;
    description: "Upper bound (90th percentile) value for Forecasted New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target) ;;
    description: "Targeted value for New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_target_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target_7day_ma) ;;
    hidden: yes
  }

  measure: recent_cum_new_profiles_forecast {
    type: max
    value_format: "0.000,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cum_new_profiles_target {
    type: max
    value_format: "0.00,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cdou_target {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }
}

view: key_in_cache {
  derived_table: {
    sql:
      SELECT COUNT(*) AS row_count
      FROM mozdata.analysis.dou_forecasts
      WHERE key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '') ;;
  }

  measure: is_cached {
    type: string
    sql: if(MAX(row_count) > 0, "Forecast for current selection is cached.", "Building forecast model, will take 2-3 minutes...") ;;
  }
}
