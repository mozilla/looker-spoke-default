
view: active_users_aggregates {
  derived_table: {
    sql:
      SELECT
        segment,
        attribution_medium,
        attribution_source,
        attributed,
        adjust_network,
        install_source,
        city,
        country,
        distribution_id,
        first_seen_year,
        is_default_browser,
        channel,
        os,
        os_version,
        os_version_major,
        os_version_minor,
        submission_date,
        locale,
        dau,
        wau,
        mau,
        daily_users,
        weekly_users,
        monthly_users,
        app_name,
        app_version,
        app_version_major,
        app_version_minor,
        app_version_patch_revision,
        app_version_is_major_release,
        os_grouped,
      FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
      WHERE
        1 = 1
         {% if distribution._parameter_value != "any" %}
          AND distribution_id LIKE '%{% parameter distribution._parameter_value %}%'
        {% endif %}
      ;;
  }

  parameter: choose_breakdown {
    label: "Choose Grouping (Rows)"
    view_label: "Date/Period Selection"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Month Number" value:"Month"}
    allowed_value: {label: "Month and Day" value: "Month_Day"}
    allowed_value: {label: "Week of Year" value: "WOY"}
    allowed_value: {label: "Day of Year" value: "DOY"}
    allowed_value: {label: "Day of Month" value: "DOM"}
    allowed_value: {label: "Day of Week" value: "DOW"}
    allowed_value: {value: "Date"}
  }

  parameter: choose_comparison {
    label: "Choose Comparison (Pivot)"
    view_label: "Date/Period Selection"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Year" }
    allowed_value: {value: "Month"}
    allowed_value: {value: "Week"}
  }

  parameter: distribution {
    label: "Firefox Distribution"
    view_label: "Firefox Distribution"
    type: unquoted
    default_value: "any"
    allowed_value: {
      label: "Vivo"
      value: "vivo"
    }
    allowed_value: {
      label: "Any"
      value: "any"
    }
  }

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
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: day_month_abbreviation {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    convert_tz: no
    datatype:  date
    sql: FORMAT_DATE("%b %d", ${TABLE}.submission_date);;
  }

  dimension: day_month_number {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    datatype:  date
    sql: FORMAT_DATE("%m-%d", ${TABLE}.submission_date);;
  }

  dimension: period_over_period_row  {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_breakdown
    type: string

    order_by_field: sort_by1
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${submission_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${submission_date}
          {% else %}NULL{% endif %} ;;
  }

  dimension: period_over_period_pivot {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_comparison
    type: string

    order_by_field: sort_by2
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% else %}NULL{% endif %} ;;
  }


  dimension: app_name {
    label: "Browser Name"
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version{
    label: "Browser Version"
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: attribution_medium {
    label: "Attribution Medium"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_medium ;;
  }

  dimension: attribution_source {
    label: "Attribution Source"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: adjust_network {
    sql: ${TABLE}.adjust_network ;;
    type: string
  }

  dimension: app_version_is_major_release {
    sql: ${TABLE}.app_version_is_major_release ;;
    type: yesno
  }

  dimension: app_version_major {
    sql: ${TABLE}.app_version_major ;;
    type: number
  }

  dimension: app_version_minor {
    sql: ${TABLE}.app_version_minor ;;
    type: number
  }

  dimension: app_version_patch_revision {
    sql: ${TABLE}.app_version_patch_revision ;;
    type: number
  }

  dimension: attributed {
    sql: ${TABLE}.attributed ;;
    type: yesno
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: city {
    sql: ${TABLE}.city ;;
    type: string
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    map_layer_name: countries
  }

  dimension: daily_users {
    sql: ${TABLE}.daily_users ;;
    type: number
  }

  dimension: distribution_id {
    sql: ${TABLE}.distribution_id ;;
    type: string
  }

  dimension: first_seen_year {
    sql: ${TABLE}.first_seen_year ;;
    type: number
  }

  dimension: install_source {
    sql: ${TABLE}.install_source ;;
    type: string
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: monthly_users {
    sql: ${TABLE}.monthly_users ;;
    type: number
  }

  dimension: segment {
    sql: ${TABLE}.segment ;;
    type: string
  }

  dimension: weekly_users {
    sql: ${TABLE}.weekly_users ;;
    type: number
  }

  dimension: is_leap_year {
    type: yesno
    sql:  MOD(EXTRACT(YEAR FROM ${TABLE}.submission_date), 4) = 0
          AND MOD(EXTRACT(YEAR FROM ${TABLE}.submission_date), 100) != 0;;
    hidden: yes
  }

  dimension: day_of_year_w_leap_day {
    type: number
    sql:
      EXTRACT(DAYOFYEAR FROM ${TABLE}.submission_date) +
      IF(${is_leap_year} AND EXTRACT(DAYOFYEAR FROM ${TABLE}.submission_date) >= 60, -1, 0)
      ;;
  }

# These dimensions are just to make sure the dimensions sort correctly
  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_of_year_w_leap_day}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${submission_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${submission_date}
          {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by2 {
    hidden: yes
    type: string
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_of_year_w_leap_day}
          {% elsif choose_comparison._parameter_value == 'Week' %} ${submission_week}
          {% else %}NULL{% endif %} ;;

  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${submission_date}) < EXTRACT(DAY FROM CURRENT_DATE()));;
  }

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  ${submission_week_of_year} < (EXTRACT(WEEK FROM CURRENT_DATE()));;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${submission_date}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE()));;
  }

  # Hide metric columns showing as dimensions
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }


  # Define measures
  measure: daily_active_users {
    label: "DAU"
    type:  sum
    sql: (${TABLE}.dau) ;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql:  ${TABLE}.wau ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql:  ${TABLE}.mau ;;
  }

  dimension: is_default_browser {
    type:  string
    case: {
      when: {
        sql: ${TABLE}.is_default_browser = true ;;
        label: "yes"
      }

      when: {
        sql: ${TABLE}.is_default_browser = false ;;
        label: "no"
      }

      when: {
        sql: ${TABLE}.is_default_browser is NULL ;;
        label: "unknown"
      }
    }
  }

# Group dimensions in Explore
  dimension: os {
    sql: ${TABLE}.os ;;
    group_label: "OS"
  }
  dimension: os_grouped {
    sql: ${TABLE}.os_grouped ;;
    group_label: "OS"
  }
  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    group_label: "OS"
  }
  dimension: os_version_major {
    sql: ${TABLE}.os_version_major ;;
    group_label: "OS"
  }
  dimension: os_version_minor {
    sql: ${TABLE}.os_version_minor ;;
    group_label: "OS"
  }
}
