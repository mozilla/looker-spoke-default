view: desktop_segments {
  derived_table:  {
    datagroup_trigger: desktop_segments_datagroup
    sql:
    with base as (
      select
          CAST(submission_date AS TIMESTAMP) AS submission_date,
          country_name,
          attributed,
          channel,
          os,
          activity_segment,
          source,
          medium,
          campaign,
          content,
          sum(dau) as dau,
          sum(wau) as wau,
          sum(mau) as mau,
          sum(cdou) as cdou,
          sum(new_profiles) as new_profiles,
          sum(cumulative_new_profiles) as cumulative_new_profiles,
      from
          ${firefox_desktop_usage_fields.SQL_TABLE_NAME} AS firefox_desktop_usage_fields
      group by 1,2,3,4,5,6,7,8,9,10
    ),

    countries as (
      select
        *,
        dense_rank() over(order by total_country_dau desc) as country_dau_rank,
        dense_rank() over(order by total_country_new_profiles desc) as country_new_profiles_rank
      from (
        select
            country_name,
            sum(dau) as total_country_dau,
            sum(new_profiles) as total_country_new_profiles
        from base
        group by 1
      )
    ),

    sources as (
      select
        *,
        dense_rank() over(order by total_source_dau desc) as source_dau_rank,
        dense_rank() over(order by total_source_new_profiles desc) as source_new_profiles_rank
      from (
        select
            source,
            sum(dau) as total_source_dau,
            sum(new_profiles) as total_source_new_profiles
        from base
        group by 1
      )
    ),

    campaigns as (
      select
        *,
        dense_rank() over(order by total_campaign_dau desc) as campaign_dau_rank,
        dense_rank() over(order by total_campaign_new_profiles desc) as campaign_new_profiles_rank
      from (
        select
            campaign,
            sum(dau) as total_campaign_dau,
            sum(new_profiles) as total_campaign_new_profiles
        from base
        group by 1
      )
    ),

    contents as (
      select
        *,
        dense_rank() over(order by total_content_dau desc) as content_dau_rank,
        dense_rank() over(order by total_content_new_profiles desc) as content_new_profiles_rank
      from (
        select
            content,
            sum(dau) as total_content_dau,
            sum(new_profiles) as total_content_new_profiles
        from base
        group by 1
      )
    ),

    mediums as (
      select
        *,
        dense_rank() over(order by total_medium_dau desc) as medium_dau_rank,
        dense_rank() over(order by total_medium_new_profiles desc) as medium_new_profiles_rank
      from (
        select
            medium,
            sum(dau) as total_medium_dau,
            sum(new_profiles) as total_medium_new_profiles
        from base
        group by 1
      )
    ),

    joined as (
        select
            *
        from base
        left join countries
        using(country_name)
        left join sources
        using(source)
        left join campaigns
        using(campaign)
        left join contents
        using(content)
        left join mediums
        using(medium)
    ),

    ma as (
      select
        *,
        avg(dau) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date rows between 6 preceding and current row) as dau_7day_ma,
        avg(dau) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date rows between 27 preceding and current row) as dau_28day_ma,
        avg(new_profiles) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date rows between 6 preceding and current row) as new_profiles_7day_ma,
        avg(new_profiles) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date rows between 27 preceding and current row) as new_profiles_28day_ma
      from joined
    )

  select
    *,
    lag(dau_7day_ma, 6) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date) as dau_ma_previous_week,
    lag(dau_28day_ma, 27) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date) as dau_ma_previous_month,
    safe_divide(dau_7day_ma, lag(dau_7day_ma, 6) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date)) - 1 as dau_wow_change,
    safe_divide(dau_28day_ma, lag(dau_28day_ma, 27) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date)) - 1 as dau_mom_change,
    lag(new_profiles_7day_ma, 6) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date) as new_profiles_ma_previous_week,
    lag(new_profiles_28day_ma, 27) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date) as new_profiles_ma_previous_month,
    safe_divide(new_profiles_7day_ma, lag(new_profiles_7day_ma, 6) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date)) - 1 as new_profiles_wow_change,
    safe_divide(new_profiles_28day_ma, lag(new_profiles_28day_ma, 27) over (partition by country_name, attributed, channel, os, activity_segment, source, medium, campaign, content order by submission_date)) - 1 as new_profiles_mom_change
  from ma;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country_name {
    type: string
    map_layer_name: countries
    order_by_field: country_dau_rank
    drill_fields: [source, campaign, medium, content, activity_segment, channel, attributed, os]
    link: {
      label: "Drill Down Dashboard for This Country"
      url: "/dashboards-next/81?Date=after%202021%2F01%2F01&Country%20Name={{ value }}"
    }
    sql: ${TABLE}.country_name ;;
  }

  dimension: source {
    type: string
    order_by_field: source_dau_rank
    drill_fields: [country_name, campaign, medium, content, activity_segment, channel, attributed, os]
    sql: ${TABLE}.source ;;
  }

  dimension: campaign {
    type: string
    order_by_field: campaign_dau_rank
    drill_fields: [country_name, source, medium, content, activity_segment, channel, attributed, os]
    sql: ${TABLE}.campaign ;;
  }

  dimension: medium {
    type: string
    order_by_field: medium_dau_rank
    drill_fields: [country_name, source, campaign, content, activity_segment, channel, attributed, os]
    sql: ${TABLE}.medium ;;
  }

  dimension: content {
    type: string
    order_by_field: content_dau_rank
    drill_fields: [country_name, source, campaign, medium, activity_segment, channel, attributed, os]
    sql: ${TABLE}.content ;;
  }

  dimension: activity_segment {
    type: string
    drill_fields: [country_name, source, campaign, medium, content, channel, attributed, os]
    sql: ${TABLE}.activity_segment ;;
  }

  dimension: os {
    type: string
    drill_fields: [country_name, source, campaign, medium, content, channel, attributed, activity_segment]
    sql: ${TABLE}.os ;;
  }

  dimension: channel {
    type: string
    drill_fields: [country_name, source, campaign, medium, content, os, attributed, activity_segment]
    sql: ${TABLE}.channel ;;
  }

  dimension: attributed {
    type: yesno
    drill_fields: [country_name, source, campaign, medium, content, os, channel, activity_segment]
    sql: ${TABLE}.attributed ;;
  }

  dimension: country_dau_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.country_dau_rank ;;
  }

  dimension: source_dau_rank {
    type: number
    hidden: no
    value_format: "#,##0"
    sql: ${TABLE}.source_dau_rank ;;
  }

  dimension: medium_dau_rank {
    type: number
    hidden: no
    value_format: "#,##0"
    sql: ${TABLE}.medium_dau_rank ;;
  }

  dimension: content_dau_rank {
    type: number
    hidden: no
    value_format: "#,##0"
    sql: ${TABLE}.content_dau_rank ;;
  }

  dimension: campaign_dau_rank {
    type: number
    hidden: no
    value_format: "#,##0"
    sql: ${TABLE}.campaign_dau_rank ;;
  }

  dimension: country_new_profiles_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.country_new_profiles_rank ;;
  }

  dimension: source_new_profiles_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.source_new_profiles_rank ;;
  }

  dimension: medium_new_profiles_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.medium_new_profiles_rank ;;
  }

  dimension: content_new_profiles_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.content_new_profiles_rank ;;
  }

  dimension: campaign_new_profiles_rank {
    type: number
    hidden: yes
    value_format: "#,##0"
    sql: ${TABLE}.campaign_new_profiles_rank ;;
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

  measure: new_profiles_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_7day_ma ;;
  }

  measure: new_profiles_28day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_28day_ma ;;
  }

  measure: new_profiles_ma_previous_week {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_ma_previous_week ;;
  }

  measure: new_profiles_ma_previous_month {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_ma_previous_month ;;
  }

}
