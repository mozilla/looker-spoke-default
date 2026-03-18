include: "//looker-hub/websites/views/www_site_events_metrics.view.lkml"

view: +www_site_events_metrics {

  dimension: version {
    view_label: "WNP"
    label: "Version"
    sql: ${TABLE}.page_level_2;;
    type: string
  }

  dimension: locale {
    view_label: "WNP"
    label: "locale"
    sql: TRIM(${TABLE}.locale, '/');;
    type: string
  }

  dimension: country {
    view_label: "WNP"
    label: "country"
    sql: ${TABLE}.country;;
    type: string
  }

  dimension: whats_new_flag {
    hidden:  yes
    case: {
      when: {
        sql: ${TABLE}.page_level_1 = "firefox"
            AND REGEXP_CONTAINS(${TABLE}.page_level_2, r'^\d{1,3}(\.\d{1,3}){1,3}((a|b(eta)?)\d*)?(pre\d*)?(esr)?$')
            AND ${TABLE}.page_level_3 = 'whatsnew';;
        label: "yes"
      }
      else: "no"
    }
  }

  measure: wnp_total_events {
    view_label: "WNP"
    label: "Whats New Page total events"
    type: sum
    sql: ${TABLE}.total_events ;;
    filters: [whats_new_flag: "yes"]
  }

  measure: wnp_unique_events {
    view_label: "WNP"
    label: "Whats New Page unique events"
    type: sum
    sql: ${TABLE}.unique_events ;;
    filters: [whats_new_flag: "yes"]
  }
}
