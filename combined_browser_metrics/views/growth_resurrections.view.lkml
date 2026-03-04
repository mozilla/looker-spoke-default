view: growth_resurrections {
  derived_table: {
    sql:
    WITH dau AS (
  SELECT
    client_id,
    submission_date, os,
    normalized_os_version, country, case when submission_date = first_seen_date then true else false end as is_new_profile,
    LAG(submission_date) OVER (
      PARTITION BY client_id
      ORDER BY submission_date
    ) AS prev_submission_date

  FROM
    `moz-fx-data-shared-prod.telemetry.desktop_active_users`
  WHERE
    is_dau = TRUE
    AND is_desktop = TRUE
    AND sample_id = 0
    AND submission_date BETWEEN DATE_SUB("2025-01-01", INTERVAL 365 DAY)
                            AND current_date()
)
, active_users AS (
  SELECT
    au.submission_date,
    au.client_id,
    mozfun.bits28.retention(
      au.days_active_bits & au.days_seen_bits,
      au.submission_date
    ) AS retention_active,
  FROM
    `moz-fx-data-shared-prod.telemetry.desktop_active_users` AS au
  WHERE
    au.submission_date BETWEEN "2025-01-01"
                            AND current_date()
    and au.sample_id = 0
)
, final_with_days AS (
  SELECT
    d.*,
    date_diff(d.submission_date, prev_submission_date, day) as num_days_since_last_seen,
    au.retention_active.day_13.active_in_week_1 AS retained_week_2,

  FROM
    dau d
  LEFT JOIN active_users au
         on d.client_id = au.client_id
         AND d.submission_date = au.retention_active.day_13.metric_date
    where d.submission_date >= "2025-01-01"
)
select submission_date,
    os,
    normalized_os_version,
    CASE WHEN lower(os) like 'windows%' THEN 'Windows'
          WHEN os = 'Darwin' THEN 'Mac'
          WHEN os  = 'Linux' THEN
          ELSE "Other" END as normalized_os,
    country,
    CASE WHEN lower(os) = 'windows%'  AND normalized_os_version like '10%' THEN 'Yes'
          ELSE "No" END AS windows_10_flag,
    CASE
      WHEN num_days_since_last_seen BETWEEN  29 AND  34 THEN ' 29-36'
      WHEN num_days_since_last_seen BETWEEN  37 AND  60 THEN ' 37-60'
      WHEN num_days_since_last_seen BETWEEN  60 AND 119 THEN ' 61-120'
      WHEN num_days_since_last_seen BETWEEN 121 AND 180 THEN '121-180'
      WHEN num_days_since_last_seen BETWEEN 181 AND 365 THEN '181-365'
      WHEN num_days_since_last_seen > 365                THEN '365+'
      ELSE 'other'END as num_days_since_last_seen,
    -- num_days_since_last_seen,
    count(distinct client_id) as dau
     , count(distinct client_id) resurrections
     , count(distinct case when retained_week_2 then client_id end) resurrections_retained_wk2

from final_with_days
WHERE not is_new_profile
AND (num_days_since_last_seen >= 29  or num_days_since_last_seen is null)
group by 1, 2, 3, 4, 5, 6;;
}


  parameter: average_window {
    label: "Moving average"
    type: string
    allowed_value: {
      label: "Single Day"
      value: "1"
    }
    allowed_value: {
      label: "7-day"
      value: "7"
    }
    allowed_value: {
      label: "28-day"
      value: "28"
    }
  }

  dimension: days_avg {
    label: "# of Days average"
    description: "Value selected on Moving average filter"
    type: number
    sql: {% parameter average_window %} ;;
  }

  dimension: date_yoy {
    label: "Date (YoY)"
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.cohort_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.cohort_date, YEAR) YEAR) ;;
  }

  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= CURRENT_DATE() - 1;;
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
    sql: FORMAT_DATE("%m-%d", DATE(${TABLE}.submission_date));;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%B", DATE(${TABLE}.submission_date));;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(DATE(${TABLE}.submission_date), QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(DATE(${TABLE}.submission_date), QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNCDATE(${TABLE}.submission_date), QUARTER)) = "07" then "Q3"
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
            WHEN DATE(${TABLE}.submission_date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.submission_date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  measure: resurrections {
    type: sum
    sql: ${TABLE}.resurrections;;
  }

  measure:retained_wk2 {
    type: sum
    sql: ${TABLE}.resurrections_retained_wk2;;
  }

  measure: retention_ate {
    type: number
    sql: SAFE_DIVIDE(${retained_wk2}, ${resurrections}) ;;
    value_format: "0.00%"
  }


  measure: current_period_resurrections {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.resurrections;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_resurrections {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.resurrections;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_week2_retained {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.resurrections_retained_wk2;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_periodweek2_retained {
    view_label: "KPI filtered metrics"
    type: sum
    sql:  ${TABLE}.resurrections_retained_wk2;;
    filters: [period_filtered_measures: "last"]
  }

  dimension: normalized_country {
    description: "Normalizing country name to focus on major markets"
    type: string
    hidden: no
    sql: CASE WHEN ${TABLE}.country in ('US','CA','GB','DE','FR','ES','IT','BR','MX','IN','ID','CN','RU') THEN ${TABLE}.country ELSE "ROW" END ;;
  }

  dimension: cleaned_os {
    description: "Recategorizing OS to match all tables that will be used in the dashboard"
    type: string
    hidden: no
    sql: ${TABLE}.normalized_os;;
  }

  dimension: windows_10_flag {
    description: "windows 10 flag"
    type: string
    hidden: no
    sql: ${TABLE}.windows_10_flag ;;
  }



}
