view: automated_kpi_forecasts_confidence_intervals {

  derived_table: {
    sql: WITH renamed_indices AS (
  SELECT forecast_end_date as asofdate,
    submission_date,
    metric_alias as target,
    aggregation_period as unit,
    DATE(forecast_predicted_at) as forecast_date,
    forecast_parameters, measure, value
  FROM `moz-fx-data-shared-prod.telemetry_derived.kpi_forecasts_v0`),
pivoted_table AS (
  SELECT * FROM renamed_indices
    PIVOT (SUM(value) FOR measure IN ('observed', 'p05', 'p10',
                  'p20', 'p30', 'p40', 'p50', 'p60',
                  'p70', 'p80', 'p90', 'p95', 'mean'))
)
SELECT CAST(asofdate AS STRING) asofdate,
    CAST(submission_date AS STRING) date,
    REPLACE(CAST(target AS STRING), "_dau", "") target,
    CAST(unit AS STRING) unit,
    CAST(forecast_date AS STRING) forecast_date,
    CAST(forecast_parameters AS STRING) forecast_parameters,
    (SELECT MAX(a) FROM UNNEST([mean, observed]) a WHERE a is not NULL) as value,
    p05 as yhat_p5,
    p10 as yhat_p10,
    p20 as yhat_p20,
    p30 as yhat_p30,
    p40 as yhat_p40,
    p50 as yhat_p50,
    p60 as yhat_p60,
    p70 as yhat_p70,
    p80 as yhat_p80,
    p90 as yhat_p90,
    p95 as yhat_p95,
FROM pivoted_table ;;
  }

  dimension: asofdate {
    label: "Last Forecasted Date"
  }

  dimension: date {
    hidden: yes
  }

  dimension_group: submission {
    timeframes: [month, month_name, year]
    datatype: date
    type: time
    convert_tz: no
    sql: CAST(${TABLE}.date AS DATE) ;;
  }

  dimension: target {
    type: string
    label: "Forecast Target"
    sql: ${TABLE}.target ;;
  }

  dimension: unit {
    type: string
    label: "Forecasting Unit"
    sql: ${TABLE}.unit ;;
  }

  dimension: forecast_date {
    label: "Forecast Run Date"
  }

  dimension: value {
    hidden:  yes
    sql: ${TABLE}.value ;;
  }

  measure: Estimated_Value {
    type: number
    description: "Forecasted if after forecast run date, observed if before. If forecasted, this is the average of the uncertainty samples."
    sql: SUM(CAST(${TABLE}.value as NUMERIC)) ;;
  }

  dimension: yhat_p5 {
    hidden:  yes
    sql: ${TABLE}.yhat_p5 ;;
  }

  measure: Estimated_05th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p5 as NUMERIC)) ;;
  }

  dimension: yhat_p10 {
    hidden:  yes
    sql: ${TABLE}.yhat_p10 ;;
  }

  measure: Estimated_10th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p10 as NUMERIC)) ;;
  }

  dimension: yhat_p20 {
    hidden:  yes
    sql: ${TABLE}.yhat_p20 ;;
  }

  measure: Estimated_20th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p20 as NUMERIC)) ;;
  }

  dimension: yhat_p30 {
    hidden:  yes
    sql: ${TABLE}.yhat_p30 ;;
  }

  measure: Estimated_30th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p30 as NUMERIC)) ;;
  }

  dimension: yhat_p40 {
    hidden:  yes
    sql: ${TABLE}.yhat_p40 ;;
  }

  measure: Estimated_40th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p40 as NUMERIC)) ;;
  }

  dimension: yhat_p50 {
    hidden:  yes
    sql: ${TABLE}.yhat_p50 ;;
  }

  measure: Estimated_50th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p50 as NUMERIC)) ;;
  }

  dimension: yhat_p60 {
    hidden:  yes
    sql: ${TABLE}.yhat_p60 ;;
  }

  measure: Estimated_60th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p60 as NUMERIC)) ;;
  }

  dimension: yhat_p70 {
    hidden:  yes
    sql: ${TABLE}.yhat_p70 ;;
  }

  measure: Estimated_70th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p70 as NUMERIC)) ;;
  }

  dimension: yhat_p80 {
    hidden:  yes
    sql: ${TABLE}.yhat_p80 ;;
  }

  measure: Estimated_80th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p80 as NUMERIC)) ;;
  }

  dimension: yhat_p90 {
    hidden:  yes
    sql: ${TABLE}.yhat_p90 ;;
  }

  measure: Estimated_90th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p90 as NUMERIC)) ;;
  }

  dimension: yhat_p95 {
    hidden:  yes
    sql: ${TABLE}.yhat_p95 ;;
  }

  measure: Estimated_95th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p95 as NUMERIC)) ;;
  }


}
