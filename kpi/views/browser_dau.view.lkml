include: "./unified_metrics.view.lkml"

view: browser_dau {
  extends: [unified_metrics]

  dimension: days_since_first_seen {
    hidden: yes
  }

  dimension: first_seen {
    hidden: yes
  }

  dimension: uri_count {
    hidden: yes
  }

  dimension: active_hours_sum {
    hidden: yes
  }

  dimension: ad_click {
    hidden: yes
  }

  dimension: search_count {
    hidden: yes
  }

  dimension: organic_search_count {
    hidden: yes
  }

  dimension: search_with_ads {
    hidden: yes
  }

  dimension: durations {
    hidden: yes
  }

  measure: total_search_count {
    hidden: yes
  }

  measure: total_uri_count {
    hidden: yes
  }

  measure: total_ad_click {
    hidden: yes
  }

  measure: total_organic_search_count {
    hidden: yes
  }

  measure: total_durations {
    hidden: yes
  }

  measure: total_active_hours_sum {
    hidden: yes
  }

  measure: total_search_with_ads {
    hidden: yes
  }

}
