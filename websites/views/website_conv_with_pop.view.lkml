include: "//looker-hub/websites/views/moz_org_metrics_summary.view.lkml"

view: website_conv_with_pop {###  Period over Period Method 3: Custom choice of current and previous periods with parameters

  # Like Method 2, but instead of using parameters to simply select the appropriate date dimension,
  # we will use liquid to define the logic to pick out the correct periods for each selection.

extends: [moz_org_metrics_summary]

  dimension_group: submission {
    type: time
    view_label: "Date/Period Selection"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: timestamp
    sql: ${TABLE}.date ;;
  }


    filter: current_date_range {
      type: date
      datatype: timestamp
      view_label: "_PoP"
      label: "1. Current Date Range"
      description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
      sql: ${period} IS NOT NULL ;;
    }

    parameter: compare_to {
      view_label: "_PoP"
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
    }



    ## ------------------ HIDDEN HELPER DIMENSIONS  ------------------ ##

    dimension: days_in_period {
      hidden:  yes
      view_label: "_PoP"
      description: "Gives the number of days in the current period date range"
      type: number
      sql: DATE_DIFF({% date_end current_date_range %}, {% date_start current_date_range %}, DAY) ;;
    }

    dimension: period_2_start {
      hidden:  yes
      view_label: "_PoP"
      description: "Calculates the start of the previous period"
      type: date
      sql:
            {% if compare_to._parameter_value == "Period" %}
            DATE_ADD({% date_start current_date_range %}, INTERVAL - ${days_in_period} DAY)
            {% else %}
            DATE_ADD({% date_start current_date_range %},INTERVAL -1 {% parameter compare_to %})
            {% endif %};;
    }

    dimension: period_2_end {
      hidden:  yes
      view_label: "_PoP"
      description: "Calculates the end of the previous period"
      type: date
      sql:
            {% if compare_to._parameter_value == "Period" %}
            DATE_ADD({% date_start current_date_range %}, INTERVAL -1 DAY)
            {% else %}
            DATE_ADD(DATE_ADD({% date_end current_date_range %}, INTERVAL -1 DAY), INTERVAL -1 {% parameter compare_to %})
            {% endif %};;
    }

    dimension: day_in_period {
      hidden: yes
      description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
      type: number
      sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} TIMESTAMP(${submission_date}) {% endcondition %}
            THEN DATE_DIFF({% date_start current_date_range %}, TIMESTAMP(${submission_date}), DAY) + 1
            WHEN TIMESTAMP(${submission_date}) between TIMESTAMP(${period_2_start}) and TIMESTAMP(${period_2_end})
            THEN DATE_DIFF(TIMESTAMP(${submission_date}), TIMESTAMP(${period_2_start}) , DAY) + 1
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
                WHEN {% condition current_date_range %} ${submission_date} {% endcondition %}
                THEN 1
                WHEN ${submission_date} between ${period_2_start} and ${period_2_end}
                THEN 2
                END
            {% else %}
                NULL
            {% endif %}
            ;;
    }

    ## ------- HIDING FIELDS  FROM ORIGINAL VIEW FILE  -------- ##

    #dimension_group: submission {hidden: yes}
    dimension: ytd_only {hidden:yes}
    dimension: mtd_only {hidden:yes}
    dimension: wtd_only {hidden:yes}


    ## ------------------ DIMENSIONS TO PLOT ------------------ ##

    dimension_group: date_in_period {
      description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
      label: "Current Period"
      type: time
      datatype: timestamp
      sql: TIMESTAMP(DATE_SUB({% date_start current_date_range %}, INTERVAL ${day_in_period} - 1 DAY)) ;;
      view_label: "_PoP"
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
    }


    dimension: period {
      view_label: "_PoP"
      label: "Period"
      description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
      type: string
      order_by_field: order_for_period
      sql:
            {% if current_date_range._is_filtered %}
                CASE
                WHEN {% condition current_date_range %} TIMESTAMP(${submission_date}){% endcondition %}
                THEN 'This {% parameter compare_to %}'
                WHEN (TIMESTAMP(${submission_date}) BETWEEN TIMESTAMP(${period_2_start}) and TIMESTAMP(${period_2_end}))
                THEN 'Last {% parameter compare_to %}'
                END
            {% else %}
                NULL
            {% endif %}
            ;;
    }


    ## ---------------------- TO CREATE FILTERED MEASURES ---------------------------- ##

    dimension: period_filtered_measures {
      hidden: yes
      description: "We just use this for the filtered measures"
      type: string
      sql:
            {% if current_date_range._is_filtered %}
                CASE
                WHEN {% condition current_date_range %} TIMESTAMP(${submission_raw}) {% endcondition %} THEN 'this'
                WHEN ${submission_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
            {% else %} NULL {% endif %} ;;
    }

    # Filtered measures

    measure: current_period_non_fx_sessions {
      view_label: "_PoP"
      type: sum
      sql: ${non_fx_sessions};;
      filters: [period_filtered_measures: "this"]
    }

    measure: previous_period_non_fx_sessions {
      view_label: "_PoP"
      type: sum
      sql: ${non_fx_sessions};;
      filters: [period_filtered_measures: "last"]
    }

  measure: current_period_downloads {
    view_label: "_PoP"
    type: sum
    sql: ${non_fx_downloads};;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_downloads {
    view_label: "_PoP"
    type: sum
    sql: ${non_fx_downloads};;
    filters: [period_filtered_measures: "last"]
  }

    measure: non_fx_sessions_pop_change {
      view_label: "_PoP"
      label: "Total non fx sessions period-over-period % change"
      type: number
      sql: CASE WHEN ${current_period_non_fx_sessions} = 0
                THEN NULL
                ELSE (1.0 * ${current_period_non_fx_sessions} / NULLIF(${previous_period_non_fx_sessions} ,0)) - 1 END ;;
      value_format_name: percent_2
    }

  measure: downloads_pop_change {
    view_label: "_PoP"
    label: "Total downloads period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_downloads} = 0
                THEN NULL
                ELSE (1.0 * ${current_period_downloads} / NULLIF(${previous_period_downloads} ,0)) - 1 END ;;
    value_format_name: percent_2
  }

  measure: unique_days {
    view_label: "_PoP"
    type: count_distinct
    sql: ${TABLE}.date ;;
    filters: [period_filtered_measures: "this"]
  }

  # measure:  unique_days {
  #   label: "Number of unique days"
  #   type: count_distinct
  #   sql: ${TABLE}.date ;;
  # }

  }
