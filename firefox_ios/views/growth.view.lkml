include: "//looker-hub/firefox_ios/views/baseline_clients_last_seen.view.lkml"

view: growth {
  extends: [baseline_clients_last_seen]

  dimension: days_since_seen {
    hidden: yes
  }

  dimension: days_since_seen_session_end {
    hidden: yes
  }

  dimension: days_since_seen_session_start {
    hidden: yes
  }

  dimension_group: first_run {
    type: time
    timeframes: [
      date,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_run_date ;;
  }

  measure: last_updated_date {
    sql: MAX(${submission_raw}) ;;
    hidden: yes
  }

  dimension: active_this_week {
    sql: mozfun.bits28.active_in_range(days_seen_bits, -6, 7) ;;
    type: yesno
    hidden: yes
  }

  dimension: active_last_week {
    sql: mozfun.bits28.active_in_range(days_seen_bits, -13, 7) ;;
    type: yesno
    hidden: yes
  }

  dimension: new_this_week {
    sql: DATE_DIFF(${submission_date}, first_run_date, DAY) BETWEEN 0 AND 6 ;;
    type: yesno
    hidden: yes
  }

  dimension: new_last_week {
    sql: DATE_DIFF(${submission_date}, first_run_date, DAY) BETWEEN 7 AND 13 ;;
    type: yesno
    hidden: yes
  }

  measure: overall_active_previous {
    type: count
    filters: [active_last_week: "yes"]
  }

  measure: overall_active_current {
    type: count
    filters: [active_this_week: "yes"]
  }

  measure: overall_resurrected {
    type: count
    filters: [new_last_week: "no", new_this_week: "no", active_last_week: "no", active_this_week: "yes"]
  }

  measure: new_users {
    type: count
    filters: [new_this_week: "yes", active_this_week: "yes"]
  }

  measure: established_users_returning {
    type: count
    filters: [new_last_week: "no", new_this_week: "no", active_last_week: "yes", active_this_week: "yes"]
  }

  measure: new_users_returning {
    type: count
    filters: [new_last_week: "yes", active_last_week: "yes", active_this_week: "yes"]
  }

  measure: new_users_churned_count {
    type: count
    filters: [new_last_week: "yes", active_last_week: "yes", active_this_week: "no"]
    hidden: yes
  }

  measure: established_users_churned_count {
    type: count
    filters: [new_last_week: "no", new_this_week: "no", active_last_week: "yes", active_this_week: "no"]
    hidden: yes
  }

  measure: new_users_churned {
    type: number
    sql: -1 * ${new_users_churned_count} ;;
  }

  measure: established_users_churned {
    type: number
    sql: -1 * ${established_users_churned_count} ;;
  }

  measure: overall_churned {
    type: number
    sql: ${new_users_churned} + ${established_users_churned} ;;
  }

  measure: overall_retention_rate {
    type: number
    sql: SAFE_DIVIDE((${established_users_returning} + ${new_users_returning}), ${overall_active_previous}) ;;
  }

  measure: established_user_retention_rate {
    type: number
    sql:  SAFE_DIVIDE(
      ${established_users_returning},
      (${established_users_returning} + ${established_users_churned_count})
    );;
  }

  measure: new_user_retention_rate {
    type: number
    sql: SAFE_DIVIDE(${new_users_returning}, (${new_users_returning} + ${new_users_churned_count})) ;;
  }

  measure: overall_churn_rate {
    type: number
    sql: SAFE_DIVIDE((${established_users_churned_count} + ${new_users_churned_count}), ${overall_active_previous}) ;;
  }

  measure: fraction_of_active_resurrected {
    type: number
    sql: SAFE_DIVIDE(${overall_resurrected}, ${overall_active_current}) ;;
  }

  measure: fraction_of_active_new {
    type: number
    sql: SAFE_DIVIDE(${new_users}, ${overall_active_current}) ;;
  }

  measure: fraction_of_active_established_returning {
    type: number
    sql: SAFE_DIVIDE(${established_users_returning}, ${overall_active_current}) ;;
  }

  measure: fraction_of_active_new_returning {
    type: number
    sql: SAFE_DIVIDE(${new_users_returning}, ${overall_active_current}) ;;
  }

  measure: quick_ratio {
    type: number
    sql: SAFE_DIVIDE((${new_users} + ${overall_resurrected}), (${established_users_churned_count} + ${new_users_churned_count})) ;;
    #drill_fields: [created_year, item_gross_margin_percentage_tier, users.age_tier, total_sale_price]
    link: {
      label: "Quick Ratio by Country"
      #url: "{{ link }}&limit=20"
      url: "https://mozilla2.cloud.looker.com/explore/fenix_release/growth_accounting?fields=growth_accounting.quick_ratio,growth_accounting.submission_date,growth_accounting.country&pivots=growth_accounting.country&fill_fields=growth_accounting.submission_date&f[growth_accounting.submission_date]=28+days&sorts=growth_accounting.submission_date+desc&limit=500&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22type%22%3A%22looker_line%22%2C%22map_plot_mode%22%3A%22points%22%2C%22heatmap_gridlines%22%3Afalse%2C%22heatmap_gridlines_empty%22%3Afalse%2C%22heatmap_opacity%22%3A0.5%2C%22show_region_field%22%3Atrue%2C%22draw_map_labels_above_data%22%3Atrue%2C%22map_tile_provider%22%3A%22light%22%2C%22map_position%22%3A%22fit_data%22%2C%22map_scale_indicator%22%3A%22off%22%2C%22map_pannable%22%3Atrue%2C%22map_zoomable%22%3Atrue%2C%22map_marker_type%22%3A%22circle%22%2C%22map_marker_icon_name%22%3A%22default%22%2C%22map_marker_radius_mode%22%3A%22proportional_value%22%2C%22map_marker_units%22%3A%22meters%22%2C%22map_marker_proportional_scale_type%22%3A%22linear%22%2C%22map_marker_color_mode%22%3A%22fixed%22%2C%22show_legend%22%3Atrue%2C%22quantize_map_value_colors%22%3Afalse%2C%22reverse_map_value_colors%22%3Afalse%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22growth_accounting.submission_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2228%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    }
  }
}
