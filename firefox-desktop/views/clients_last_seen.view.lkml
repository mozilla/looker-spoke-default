include: "//looker-hub/firefox_desktop/views/*.view.lkml"

view: client_counts {
  extends: [clients_last_seen]

  measure: dau_created_profile {
    type: count
    filters: [days_since_created_profile: "<=0"]
  }

  measure: dau_first_seen {
    type: count
    filters: [days_since_first_seen: "<=0"]
  }

  measure: dau_had_8_active_ticks {
    type: count
    filters: [days_since_had_8_active_ticks: "<=0"]
  }

  measure: dau_interacted {
    type: count
    filters: [days_since_interacted: "<=0"]
  }

  measure: dau_opened_dev_tools {
    type: count
    filters: [days_since_opened_dev_tools: "<=0"]
  }

  measure: dau_second_seen {
    type: count
    filters: [days_since_second_seen: "<=0"]
  }

  measure: dau_seen {
    type: count
    filters: [days_since_seen: "<=0"]
  }

  measure: dau_visited_10_uri {
    type: count
    filters: [days_since_visited_10_uri: "<=0"]
  }

  measure: dau_visited_1_uri {
    type: count
    filters: [days_since_visited_1_uri: "<=0"]
  }

  measure: dau_visited_5_uri {
    type: count
    filters: [days_since_visited_5_uri: "<=0"]
  }

  measure: new_profiles {
    type: count
    filters: [days_since_first_seen: "=27"]
  }

  measure: new_profiles_core_active {
    type: count
    filters: [days_since_first_seen: "=27", is_core_active_v1: "True"]
  }

}
