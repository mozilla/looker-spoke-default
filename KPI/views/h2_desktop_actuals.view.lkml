view: h2_desktop_actuals {
  derived_table: {
    sql:
      WITH base AS (
        SELECT
          submission_date AS date,
          SUM(dau) AS dau
          FROM `mozdata.telemetry.firefox_desktop_usage_2021`
          -- WHERE submission_date >= "2021-07-01"
          GROUP BY 1 ORDER BY 1
      )

      SELECT
        *,
        SUM(dau) OVER (ORDER BY date) AS cdou,
        AVG(dau) OVER window_7day as dau_7day_ma
      FROM base
      WINDOW window_7day AS (order by date rows between 6 preceding and current row);;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  measure: dau {
    type: number
    label: "DAU Actual"
    sql: ANY_VALUE(${TABLE}.dau) ;;
  }

  measure: dau_7day_ma {
    type: number
    label: "DAU Actual 7 Day MA"
    sql: ANY_VALUE(${TABLE}.dau_7day_ma) ;;
  }

  measure: cdou {
    type: number
    label: "CDOU Actual"
    sql: ANY_VALUE(${TABLE}.cdou) ;;
  }

}
