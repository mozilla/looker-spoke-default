view: cdou_share_by_country {
  derived_table: {
    sql:
with total_dou as (
  SELECT
    date_trunc(submission_date, MONTH) as submission_date,
    SUM(dau) AS total
  FROM
    mozdata.telemetry.firefox_desktop_exact_mau28_by_dimensions desktop
  WHERE
    {% condition submission_date_month %} desktop.submission_date {% endcondition %}
  GROUP BY 1),

country_dou AS (
  SELECT
    date_trunc(submission_date, MONTH) as submission_date,
    country,
    SUM(dau) AS dou
  FROM
    mozdata.telemetry.firefox_desktop_exact_mau28_by_dimensions desktop
  WHERE
    {% condition submission_date_month %} desktop.submission_date {% endcondition %}
    AND {% condition country %} desktop.country {% endcondition %}
  GROUP BY 1, 2)

SELECT
  submission_date,
  country,
  AVG(dou/total) as CDOU_share
FROM country_dou
LEFT JOIN total_dou
USING (submission_date)
GROUP BY 1, 2
ORDER BY 1
      ;;
  }

  filter: date_filter {
    type: date
    sql: {% condition date_filter %} ${submission_date_month} {% endcondition %};;
  }

  dimension_group: submission_date {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      month
    ]
    convert_tz: no
    datatype: date
    hidden: yes
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  filter: country_filter {
    type: string
    sql: {% condition country_filter %} ${country} {% endcondition %};;
  }

  measure: CDOU_share {
    label: "CDOU Share by Country"
    type: average
    sql: ${TABLE}.CDOU_share ;;
    value_format: "0.0000"
  }

  }
