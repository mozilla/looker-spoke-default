view: desktop_segments {
  derived_table:  {
    sql:
    with base as (
      select
          CAST(submission_date AS TIMESTAMP) AS submission_date,
          country_name,
          sum(dau) as dau,
          sum(wau) as wau,
          sum(mau) as mau,
          sum(cdou) as cdou,
          sum(new_profiles) as new_profiles,
          sum(cumulative_new_profiles) as cumulative_new_profiles,
      from
          ${firefox_desktop_usage_fields.SQL_TABLE_NAME} AS firefox_desktop_usage_fields
      where
          {% condition desktop_segments.activity_segment %} activity_segment {% endcondition %}
          AND {% condition desktop_segments.campaign %} campaign {% endcondition %}
          AND {% condition desktop_segments.channel %} channel {% endcondition %}
          AND {% condition desktop_segments.content %} content {% endcondition %}
          AND {% condition desktop_segments.distribution_id %} distribution_id {% endcondition %}
          AND {% condition desktop_segments.id_bucket %} id_bucket {% endcondition %}
          AND {% condition desktop_segments.medium %} medium {% endcondition %}
          AND {% condition desktop_segments.os %} os {% endcondition %}
          AND {% condition desktop_segments.source %} source {% endcondition %}
          AND {% condition desktop_segments.attributed %} attributed {% endcondition %}
      group by 1, 2
    ),

    grouped as (
      select
        country_name,
        avg(dau) as avg_dau
      from base
      group by 1
    ),

    ma as (
      select
        *,
        dense_rank() over (order by avg_dau desc) as country_rank,
        avg(dau) over (partition by country_name order by submission_date rows between 6 preceding and current row) as dau_7day_ma,
        avg(dau) over (partition by country_name order by submission_date rows between 27 preceding and current row) as dau_28day_ma,
        avg(new_profiles) over (partition by country_name order by submission_date rows between 6 preceding and current row) as new_profiles_7day_ma
      from base
      inner join grouped
      using(country_name)
    )

  select
    *,
    lag(dau_7day_ma, 6) over (partition by country_name order by submission_date) as dau_ma_previous_week,
    lag(dau_28day_ma, 27) over (partition by country_name order by submission_date) as dau_ma_previous_month,
    safe_divide(dau_7day_ma, lag(dau_7day_ma, 6) over (partition by country_name order by submission_date)) - 1 as dau_wow_change,
    safe_divide(dau_28day_ma, lag(dau_28day_ma, 27) over (partition by country_name order by submission_date)) - 1 as dau_mom_change
  from ma;;
  }

  filter: activity_segment {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.activity_segment
    type: string
    description: "The classification of clients based on days of use with at least one URI browsed."
  }

  filter: campaign {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.campaign
    type: string
    description: "The (UTM) campaign that profiles are attributed to."
  }

  filter: channel {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.channel
    type: string
    description: "Firefox release channel."
  }

  filter: content {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.content
    type: string
    description: "The UTM content that profiles are attributed to."
  }

  filter: distribution_id {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.distribution_id
    type: string
    description: "The distribution ID, through a partner or a repack."
  }

  filter: id_bucket {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.id_bucket
    type: number
    description: "For sampling: each client_id is mapped to one of twenty id_buckets."
  }

  filter: medium {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.medium
    type: string
    description: "The UTM medium that profiles are attributed to."
  }

  filter: os {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.os
    type: string
    description: "Profile's Operating System."
  }

  filter: source {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.source
    type: string
    description: "The UTM source that the profile is attributed to."
  }

  filter: attributed {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.attributed
    type: yesno
    description: "Attributed installs have a non-null UTM source or UTM campaign."
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country_name {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_name ;;
  }

  dimension: country_rank {
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.country_rank ;;
  }

  measure: dau_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_7day_ma ;;
  }

  measure: dau_28day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_28day_ma ;;
  }

  measure: dau_ma_previous_week {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_ma_previous_week ;;
  }

  measure: dau_ma_previous_month {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_ma_previous_month ;;
  }

  measure: dau_wow_change {
    type: sum
    value_format: "0.000%"
    sql: ${TABLE}.dau_wow_change ;;
  }

  measure: dau_mom_change {
    type: sum
    value_format: "0.000%"
    sql: ${TABLE}.dau_mom_change ;;
  }

}
