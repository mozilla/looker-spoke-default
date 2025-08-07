view: search_aggregates {
  sql_table_name: `mozdata.search.search_aggregates`
    ;;


  dimension: addon_version {
    type: string
    sql: ${TABLE}.addon_version ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: major_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).major_version ;;
    description: "The major version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: minor_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).minor_version ;;
    description: "The minor version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: client_count {
    type: number
    sql: ${TABLE}.client_count ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: default_private_search_engine {
    type: string
    sql: ${TABLE}.default_private_search_engine ;;
  }

  dimension: default_search_engine {
    type: string
    sql: ${TABLE}.default_search_engine ;;
  }

  dimension: distribution_id {
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: engine {
    type: string
    sql: ${TABLE}.engine ;;
  }

  dimension: is_default_browser {
    type: yesno
    sql: ${TABLE}.is_default_browser ;;
  }

  dimension: is_enterprise {
    type: yesno
    sql: ${TABLE}.policies_is_enterprise ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: normalized_engine {
    type: string
    sql: ${TABLE}.normalized_engine ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: search_cohort {
    type: string
    sql: ${TABLE}.search_cohort ;;
  }


  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

    dimension_group: submission {
      sql: ${TABLE}.submission_date ;;
      type: time
      timeframes: [
        date,
        day_of_week_index,
        day_of_week,
        day_of_year,
        day_of_month,
        week,
        week_of_year,
        month,
        month_name,
        month_num,
        quarter,
        year,
      ]
      convert_tz: no
      datatype: date
    }

    dimension: submission_raw{
      sql:  ${submission_date::datetime} ;;
      type: date_raw
      hidden: yes
    }


## POP ##

  filter: current_date_range {
    type: date
    view_label: "Period over Period Analysis Parameters"
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    sql: ${period} IS NOT NULL;;
    convert_tz: no
  }

  parameter: compare_to {
    view_label: "Period over Period Analysis Parameters"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date Range filter"
    label: "2. Compare To:"
    type: unquoted
    allowed_value: {
      label: "Previous Period"
      value: "Period"
    }
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
    default_value: "Period"
    # view_label: "Period over Period Analysis Parameters" view_label having been declared twice in the article
  }

  dimension: days_in_period {
    hidden:  yes
    view_label: "Period over Period Analysis Parameters"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATE_DIFF( DATE({% date_start current_date_range %}), DATE({% date_end current_date_range %}), DAY) ;;
  }

  dimension: period_2_start {
    hidden:  yes
    view_label: "Period over Period Analysis Parameters"
    description: "Calculates the start of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL ${days_in_period} DAY)
        {% else %}
        DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL 1 {% parameter compare_to %})
        {% endif %};;
    convert_tz: no
  }

  dimension: period_2_end {
    hidden:  yes
    view_label: "Period over Period Analysis Parameters"
    description: "Calculates the end of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL 1 DAY)
        {% else %}
        DATE_SUB(DATE_SUB(DATE({% date_end current_date_range %}), INTERVAL 1 DAY), INTERVAL 1 {% parameter compare_to %})
        {% endif %};;
    convert_tz: no
  }

  dimension: day_in_period {
    hidden: yes
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
          {% if current_date_range._is_filtered %}
              CASE
              WHEN {% condition current_date_range %} ${submission_raw} {% endcondition %}
              THEN DATE_DIFF( DATE({% date_start current_date_range %}), ${submission_date}, DAY) + 1
              WHEN ${submission_date} between ${period_2_start} and ${period_2_end}
              THEN DATE_DIFF(${period_2_start}, ${submission_date}, DAY) + 1
              END
          {% else %} NULL
          {% endif %}
          ;;
  }

  dimension: order_for_period {
    hidden: yes
    type: number
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${submission_raw} {% endcondition %}
            THEN 1
            WHEN ${submission_date} between ${period_2_start} and ${period_2_end}
            THEN 2
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }


## ------------------ DIMENSIONS TO PLOT ------------------ ##

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Current Period"
    type: time
    # sql: DATE_ADD( ${day_in_period} - 1, DATE({% date_start current_date_range %}), DAY) ;;
    sql: DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL (${day_in_period} - 1) DAY)  ;;
    view_label: "Period over Period Analysis Parameters"
    timeframes: [
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month,
      month_name,
      month_num,
      year]
    convert_tz: no
  }


  dimension: period {
    view_label: "Period over Period Analysis Parameters"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    order_by_field: order_for_period
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${submission_raw} {% endcondition %}
            THEN 'This {% parameter compare_to %}'
            WHEN ${submission_date} between ${period_2_start} and ${period_2_end}
            THEN 'Last {% parameter compare_to %}'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }
  dimension: period_filtered_measures {
    hidden: no
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${submission_raw} {% endcondition %} THEN 'this'
            WHEN ${submission_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }



  measure: total_searches {
    label: "SAP Searches"
    type: sum
    sql: ${TABLE}.sap ;;
    description: "Total searches from all Search Access Points (SAPs), not including follow-ons.
    These may or may not be tagged."
  }

  measure: total_tagged_sap_searches {
    label: "Tagged SAP Searches"
    type: sum
    sql:${TABLE}.tagged_sap ;;
    description: "Total tagged searches from all Search Access Points (SAPs)."
  }

  measure: total_tagged_searches {
    label: "Tagged Searches"
    type: sum
    sql: ${TABLE}.tagged_sap + ${TABLE}.tagged_follow_on ;;
    description: "Total tagged searches from all Search Access Points (SAPs) and follow-ons."
  }

  measure: total_tagged_follow_on_searches {
    label: "Tagged Follow-on Searches"
    type: sum
    sql: ${TABLE}.tagged_follow_on ;;
    description: "Total follow-on searches, which occur after a search from a Search Access Point (SAP)."
  }

  measure: total_organic_searches {
    label: "Organic Searches"
    type: sum
    sql: ${TABLE}.organic ;;
    description: "Total organic searches, made directly at the engine's website."
  }

  measure: total_searches_with_ads {
    label: "Searches With Ads"
    type: sum
    sql:${TABLE}.search_with_ads ;;
    description: "Total searches with ads. Does not include organic searches."
  }

  measure: total_organic_searches_with_ads {
    label: "Organic Searches With Ads"
    type: sum
    sql: ${TABLE}.search_with_ads_organic ;;
    description: "Total organic searches with ads. "
  }

  measure: total_ad_clicks {
    label: "Ad Clicks"
    type: sum
    sql: ${TABLE}.ad_click ;;
    description: "Total ad clicks. Does not include ad clicks resulting from organic searches."
  }

  measure: total_organic_ad_clicks {
    label: "Organic Ad Clicks"
    type: sum
    sql: ${TABLE}.ad_click_organic ;;
    description: "Total organic ad clicks."
  }
}
