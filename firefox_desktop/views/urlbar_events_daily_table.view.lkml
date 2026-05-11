include: "//looker-hub/firefox_desktop/views/urlbar_events_daily_table.view.lkml"

view: +urlbar_events_daily_table {

    dimension: app_display_version {
      sql: ${TABLE}.app_display_version ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "App version"
    }

    dimension: firefox_suggest_enabled {
      sql: ${TABLE}.firefox_suggest_enabled ;;
      group_label: "User Preferences"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Firefox Suggest Enabled"
    }

    dimension: is_adaptive {
      sql: ${TABLE}.is_adaptive ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from adaptive algorithm."
    }

    dimension: is_AI {
      sql: ${TABLE}.is_ai ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is associated with an \"ai\" result"
    }

    dimension: is_from_device {
      sql: ${TABLE}.is_from_device ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from the client/device."
    }

    dimension: is_geo_local {
      sql: ${TABLE}.is_geo_local ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type represents a local suggestion based on the client's geolocation."
    }

    dimension: is_offline_suggest {
      sql: ${TABLE}.is_offline_suggest ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from Offline Suggest."
    }

    dimension: is_online_suggest {
      sql: ${TABLE}.is_online_suggest ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from Online Suggest."
    }

    dimension: is_semantic {
      sql: ${TABLE}.is_semantic ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from semantic algorithm."
    }

    dimension: is_serp {
      sql: ${TABLE}.is_serp ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag is for when result type is from Search Engine Result Page."
    }

    dimension: is_sponsored {
      sql: ${TABLE}.is_sponsored ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is from a sponsored partner."
    }

    dimension: is_top_pick {
      sql: ${TABLE}.is_top_pick ;;
      group_label: "Attribution"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Flag for when result type is associated with a top_pick group."
    }

    dimension: normalized_channel {
      sql: ${TABLE}.normalized_channel ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "The normalized channel the application is being distributed on."
    }

    dimension: normalized_country_code {
      sql: ${TABLE}.normalized_country_code ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "Code of the country in which the activity took place, as determined by the IP geolocation. Unknown or NULL values are normally stored as '??'."
    }

    dimension: normalized_engine {
      sql: ${TABLE}.normalized_engine ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "Normalized default search engine"
    }

    dimension: normalized_os {
      sql: ${TABLE}.normalized_os ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "The normalized name of the operating system running at the client."
    }

    dimension: ohttp_enabled {
      sql: ${TABLE}.ohttp_enabled ;;
      group_label: "User Preferences"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "If OHTTP both available and enabled. NULL if available is NULL."
    }

    dimension: os_version {
      sql: ${TABLE}.os_version ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "Version of the operating system version running at the client. E.g. \"100.9.11\"."
    }

    dimension: pref_ohttp_available {
      sql: ${TABLE}.pref_ohttp_available ;;
      group_label: "User Preferences"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Whether online Suggest is available to the user."
    }

    dimension: pref_ohttp_enabled {
      sql: ${TABLE}.pref_ohttp_enabled ;;
      group_label: "User Preferences"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Whether online Suggest is enabled by the user."
    }

    dimension: product_result_type {
      sql: ${TABLE}.product_result_type ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "Product type identifier for this result."
    }

    dimension: SAP {
      sql: ${TABLE}.sap ;;
      type: string
      suggest_persist_for: "24 hours"
      description: "Search Access Point."
    }

    dimension: sponsored_suggestions_enabled {
      sql: ${TABLE}.sponsored_suggestions_enabled ;;
      group_label: "User Preferences"
      type: yesno
      suggest_persist_for: "24 hours"
      description: "Sponsored Suggestions Enabled"
    }


  dimension: urlbar_impressions {
    hidden: yes
  }

  dimension: urlbar_annoyances {
    hidden: yes
  }

  dimension: urlbar_clicks {
    hidden: yes
  }

  dimension: urlbar_sessions {
    hidden: yes
  }

  measure: total_urlbar_impressions {
    group_label: "Urlbar Metrics"
    description: "The number of times a user exits the urlbar dropdown menu, either by abandoning the urlbar, engaging with a urlbar result, or selecting an annoyance signal that closes the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_impressions) ;;
    type: number
  }

  measure: total_urlbar_annoyances {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on annoyance signals across all results shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_annoyances) ;;
    type: number
  }

  measure: total_urlbar_clicks {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on any result shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_clicks) ;;
    type: number
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

  sql_table_name: `mozdata.firefox_desktop.urlbar_events_daily` ;;

}
