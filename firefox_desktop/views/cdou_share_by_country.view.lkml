view: cdou_share_by_country {
  derived_table: {
    sql:
with total_dou as (
  SELECT
    date_trunc(submission_date, MONTH) as ds_month,
    SUM(dau) AS total
  FROM
    mozdata.telemetry.firefox_desktop_exact_mau28_by_dimensions desktop
  WHERE
    {% condition submission_date %} desktop.submission_date {% endcondition %}
  GROUP BY 1),

country_dou AS (
  SELECT
    date_trunc(submission_date, MONTH) as ds_month,
    country,
    SUM(dau) AS dou
  FROM
    mozdata.telemetry.firefox_desktop_exact_mau28_by_dimensions desktop
  WHERE
    {% condition submission_date %} desktop.submission_date {% endcondition %}
    AND {% condition country %} desktop.country {% endcondition %}
  GROUP BY 1, 2)

SELECT country,
  AVG(dou/total) as CDOU_share
FROM country_dou
LEFT JOIN total_dou
USING (ds_month)
GROUP BY 1
ORDER BY 1
      ;;
  }

  dimension: submission_date {
    type: date_month
    sql: ${TABLE}.submission_date ;;
    hidden: yes
  }


  filter: date_filter {
    type: date
    sql: {% condition date_filter %} ${submission_date} {% endcondition %};;
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
