include: "//looker-hub/subscription_platform/views/vat_rates.view.lkml"

view: +vat_rates {
  derived_table: {
    sql:
      SELECT
        *,
        LAG(effective_date) OVER (PARTITION BY country_code ORDER BY effective_date) AS prev_effective_date,
        LEAD(effective_date) OVER (PARTITION BY country_code ORDER BY effective_date) AS next_effective_date,
      FROM
        mozdata.subscription_platform.vat_rates ;;
  }

  dimension_group: next_effective {
    sql: ${TABLE}.next_effective_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension_group: prev_effective {
    sql: ${TABLE}.prev_effective_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }
}
