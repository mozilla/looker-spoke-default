view: desktop_funnels_telemetry {
  derived_table: {
    sql:
WITH tbl_agg AS
  (SELECT first_seen_date AS submission_date,
          CASE
              WHEN country IN ('US','GB','DE','FR','CA',
                                    'BR','MX','CN','IN','AU',
                                    'NL','ES','RU') THEN country
              ELSE 'ROW'
          END AS normalized_country_code_subset,
          funnel_derived,
          count(*) AS new_profiles,
          SUM(CASE
                  WHEN qualified_second_day = TRUE THEN 1
                  ELSE 0
              END) AS returned_second_day,
          SUM(CASE
                  WHEN qualified_week4 = TRUE THEN 1
                  ELSE 0
              END) AS retained_week4
   FROM `mozdata.telemetry.clients_first_seen_28_days_later`
   WHERE first_seen_date >= '2021-01-01'
   GROUP BY ALL),
     tbl_smoothed AS
  (SELECT *,
          AVG(new_profiles) OVER (PARTITION BY funnel_derived,
                                               normalized_country_code_subset
            ORDER BY submission_date
                     ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
                                            AS new_profiles_smoothed,
          AVG(returned_second_day) OVER (PARTITION BY funnel_derived,
                                                      normalized_country_code_subset
            ORDER BY submission_date
                     ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
                                            AS returned_second_day_smoothed,
          AVG(retained_week4) OVER (PARTITION BY funnel_derived,
                                                 normalized_country_code_subset
             ORDER BY submission_date
                     ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
                                            AS retained_week4_smoothed
   FROM tbl_agg)
SELECT a.*,
       b.new_profiles AS new_profiles_prev_year,
       b.returned_second_day AS returned_second_day_prev_year,
       b.retained_week4 AS retained_week4_prev_year,
       b.new_profiles_smoothed AS new_profiles_smoothed_prev_year,
       b.returned_second_day_smoothed AS returned_second_day_smoothed_prev_year,
       b.retained_week4_smoothed AS retained_week4_smoothed_prev_year
FROM tbl_smoothed a
LEFT JOIN tbl_smoothed b
    ON (DATE_ADD(b.submission_date, INTERVAL 1 YEAR) = a.submission_date
        AND COALESCE(a.funnel_derived, 'tmp_NA') = COALESCE(b.funnel_derived, 'tmp_NA')
        AND COALESCE(a.normalized_country_code_subset,
                     'tmp_NA') = COALESCE(b.normalized_country_code_subset, 'tmp_NA')
 ) ;;
  }


  dimension: normalized_country_code_subset {
    type: string
    sql: ${TABLE}.normalized_country_code_subset
      ;;
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code.
    Other then those countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived
      ;;
    type: string
    description: "meta identifer: defining membership in the different firefox acquisition funnels"
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    description: "derived from GA timestamp of the raw data, this is a date in the underlying table"
  }

  measure: new_profiles {
    description: "new profiles"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: returned_second_day {
    description: "used browser again at least once next 28 days"
    type: sum
    sql: ${TABLE}.returned_second_day ;;
  }

  measure: retained_week4 {
    description: "used browser again days 21-28"
    type: sum
    sql: ${TABLE}.retained_week4 ;;
  }

  measure: new_profiles_smoothed {
    description: "new profiles (7 day smoothed)"
    type: sum
    sql: ${TABLE}.new_profiles_smoothed ;;
  }

  measure: returned_second_day_smoothed {
    description: "used browser again at least once next 28 days (7 day smoothed)"
    type: sum
    sql: ${TABLE}.returned_second_day_smoothed ;;
  }

  measure: retained_week4_smoothed {
    description: "used browser again days 21-28 (7 day smoothed)"
    type: sum
    sql: ${TABLE}.retained_week4_smoothed ;;
  }

  measure: new_profiles_prev_year {
    description: "prev. year's new profiles (7 day smoothed)"
    type: sum
    sql: ${TABLE}.new_profiles_prev_year ;;
  }

  measure: returned_second_day_prev_year {
    description: "prev. year's used browser again at least once next 28 days (7 day smoothed)"
    type: sum
    sql: ${TABLE}.returned_second_day_prev_year ;;
  }

  measure: retained_week4_prev_year {
    description: "prev. year's used browser again days 21-28 (7 day smoothed)"
    type: sum
    sql: ${TABLE}.retained_week4_prev_year ;;
  }

  measure: new_profiles_smoothed_prev_year {
    description: "prev. year's new profiles (7 day smoothed)"
    type: sum
    sql: ${TABLE}.new_profiles_smoothed_prev_year ;;
  }

  measure: returned_second_day_smoothed_prev_year {
    description: "prev. year's used browser again at least once next 28 days (7 day smoothed)"
    type: sum
    sql: ${TABLE}.returned_second_day_smoothed_prev_year ;;
  }

  measure: retained_week4_smoothed_prev_year {
    description: "prev. year's used browser again days 21-28 (7 day smoothed)"
    type: sum
    sql: ${TABLE}.retained_week4_smoothed_prev_year ;;
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores. Purely for ease of building charts"
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user
    inputed, not referring to data in the table"
  }

}
