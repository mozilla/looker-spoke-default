include: "//looker-hub/firefox_desktop/views/metrics.view.lkml"

# Safe Browsing (URL classifier) baseline — MNTOR-5334.
#
# Why this file exists: urlclassifier.ui_events records an event code per
# warning interaction, stored as an array of {key: code, value: times}. The
# generated LookML exposes only the record's `sum` field, which adds up the
# event CODES rather than the counts (9 + 9 + 12 = 30), so it means nothing.
# The array itself has no column reference to join against, so there was no way
# to group by event code.
#
# This adds that column reference and maps each code to a readable name.

view: +metrics {
  # No array column references are generated for these, so the explore has
  # nothing to join. Hidden because the raw arrays are not useful directly.
  dimension: metrics__custom_distribution__urlclassifier_ui_events__values {
    sql: ${TABLE}.metrics.custom_distribution.urlclassifier_ui_events.values ;;
    hidden: yes
  }

  dimension: metrics__custom_distribution__application_reputation_server_verdict__values {
    sql: ${TABLE}.metrics.custom_distribution.application_reputation_server_verdict.values ;;
    hidden: yes
  }
}

# Event codes 1-32 are defined in
# toolkit/components/url-classifier/IUrlClassifierUITelemetry.idl.
# The mappings below are transcribed from that file and are meant to be diffed
# against it directly. An unrecognised code returns NULL rather than a wrong
# label.
view: +metrics__metrics__custom_distribution__urlclassifier_ui_events__values {
  label: "Safe Browsing: Warnings"

  dimension: event_code {
    label: "Event Code"
    description: "Raw value from IUrlClassifierUITelemetry.idl (1-32)."
    type: number
    sql: SAFE_CAST(${TABLE}.key AS INT64) ;;
  }

  dimension: threat_type {
    label: "Threat Type"
    type: string
    sql: CASE
           WHEN ${event_code} BETWEEN  1 AND  8 THEN 'Malware'
           WHEN ${event_code} BETWEEN  9 AND 16 THEN 'Phishing'
           WHEN ${event_code} BETWEEN 17 AND 24 THEN 'Unwanted'
           WHEN ${event_code} BETWEEN 25 AND 32 THEN 'Harmful'
         END ;;
  }

  dimension: scope {
    label: "Scope"
    description: "Whether the blocked resource was the page itself or an iframe inside it."
    type: string
    sql: CASE
           WHEN ${event_code} IN (1, 2, 3, 4, 9, 10, 11, 12, 17, 18, 19, 20, 25, 26, 27, 28) THEN 'Top-level page'
           WHEN ${event_code} IN (5, 6, 7, 8, 13, 14, 15, 16, 21, 22, 23, 24, 29, 30, 31, 32) THEN 'Iframe'
         END ;;
  }

  dimension: ui_action {
    label: "UI Action"
    description: "Warning shown, or which button the user pressed on the interstitial."
    type: string
    sql: CASE
           WHEN ${event_code} IN (1, 5,  9, 13, 17, 21, 25, 29) THEN 'Warning shown'
           WHEN ${event_code} IN (2, 6, 10, 14, 18, 22, 26, 30) THEN 'Why blocked'
           WHEN ${event_code} IN (3, 7, 11, 15, 19, 23, 27, 31) THEN 'Leave site'
           WHEN ${event_code} IN (4, 8, 12, 16, 20, 24, 28, 32) THEN 'Proceed anyway'
         END ;;
  }

  dimension: event_name {
    label: "Event Name"
    description: "The constant name from IUrlClassifierUITelemetry.idl."
    type: string
    sql: CASE ${event_code}
           WHEN  1 THEN 'WARNING_MALWARE_PAGE_TOP'
           WHEN  2 THEN 'WARNING_MALWARE_PAGE_TOP_WHY_BLOCKED'
           WHEN  3 THEN 'WARNING_MALWARE_PAGE_TOP_GET_ME_OUT_OF_HERE'
           WHEN  4 THEN 'WARNING_MALWARE_PAGE_TOP_IGNORE_WARNING'
           WHEN  5 THEN 'WARNING_MALWARE_PAGE_FRAME'
           WHEN  6 THEN 'WARNING_MALWARE_PAGE_FRAME_WHY_BLOCKED'
           WHEN  7 THEN 'WARNING_MALWARE_PAGE_FRAME_GET_ME_OUT_OF_HERE'
           WHEN  8 THEN 'WARNING_MALWARE_PAGE_FRAME_IGNORE_WARNING'
           WHEN  9 THEN 'WARNING_PHISHING_PAGE_TOP'
           WHEN 10 THEN 'WARNING_PHISHING_PAGE_TOP_WHY_BLOCKED'
           WHEN 11 THEN 'WARNING_PHISHING_PAGE_TOP_GET_ME_OUT_OF_HERE'
           WHEN 12 THEN 'WARNING_PHISHING_PAGE_TOP_IGNORE_WARNING'
           WHEN 13 THEN 'WARNING_PHISHING_PAGE_FRAME'
           WHEN 14 THEN 'WARNING_PHISHING_PAGE_FRAME_WHY_BLOCKED'
           WHEN 15 THEN 'WARNING_PHISHING_PAGE_FRAME_GET_ME_OUT_OF_HERE'
           WHEN 16 THEN 'WARNING_PHISHING_PAGE_FRAME_IGNORE_WARNING'
           WHEN 17 THEN 'WARNING_UNWANTED_PAGE_TOP'
           WHEN 18 THEN 'WARNING_UNWANTED_PAGE_TOP_WHY_BLOCKED'
           WHEN 19 THEN 'WARNING_UNWANTED_PAGE_TOP_GET_ME_OUT_OF_HERE'
           WHEN 20 THEN 'WARNING_UNWANTED_PAGE_TOP_IGNORE_WARNING'
           WHEN 21 THEN 'WARNING_UNWANTED_PAGE_FRAME'
           WHEN 22 THEN 'WARNING_UNWANTED_PAGE_FRAME_WHY_BLOCKED'
           WHEN 23 THEN 'WARNING_UNWANTED_PAGE_FRAME_GET_ME_OUT_OF_HERE'
           WHEN 24 THEN 'WARNING_UNWANTED_PAGE_FRAME_IGNORE_WARNING'
           WHEN 25 THEN 'WARNING_HARMFUL_PAGE_TOP'
           WHEN 26 THEN 'WARNING_HARMFUL_PAGE_TOP_WHY_BLOCKED'
           WHEN 27 THEN 'WARNING_HARMFUL_PAGE_TOP_GET_ME_OUT_OF_HERE'
           WHEN 28 THEN 'WARNING_HARMFUL_PAGE_TOP_IGNORE_WARNING'
           WHEN 29 THEN 'WARNING_HARMFUL_PAGE_FRAME'
           WHEN 30 THEN 'WARNING_HARMFUL_PAGE_FRAME_WHY_BLOCKED'
           WHEN 31 THEN 'WARNING_HARMFUL_PAGE_FRAME_GET_ME_OUT_OF_HERE'
           WHEN 32 THEN 'WARNING_HARMFUL_PAGE_FRAME_IGNORE_WARNING'
         END ;;
  }

  dimension: key {
    hidden: yes
  }

  dimension: value {
    hidden: yes
  }

  # ---- volume ----

  measure: event_count {
    label: "Event Count"
    description: "How many times these events happened. Slice by Threat Type, Scope, and UI Action."
    type: sum
    sql: ${value} ;;
  }

  # ---- phishing, top-level page: the numbers MNTOR-5334 needs ----

  measure: phishing_warnings_shown {
    label: "Phishing Warnings Shown"
    description: "Code 9. Top-level phishing interstitials displayed."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "9"]
  }

  measure: phishing_warnings_overridden {
    label: "Phishing Warnings Overridden"
    description: "Code 12. The user chose to proceed to the site anyway."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "12"]
  }

  measure: phishing_left_site {
    label: "Phishing: Left Site"
    description: "Code 11. The user pressed 'Get me out of here'."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "11"]
  }

  measure: phishing_why_blocked {
    label: "Phishing: Why Blocked"
    description: "Code 10."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "10"]
  }

  measure: phishing_override_rate {
    label: "Phishing Override Rate"
    description: "Overridden / Shown, top-level. A ceiling on how much better detection can buy us."
    type: number
    sql: SAFE_DIVIDE(${phishing_warnings_overridden}, ${phishing_warnings_shown}) ;;
    value_format_name: percent_2
  }

  measure: phishing_heeded_rate {
    label: "Phishing Heeded Rate"
    description: "Left Site / Shown, top-level."
    type: number
    sql: SAFE_DIVIDE(${phishing_left_site}, ${phishing_warnings_shown}) ;;
    value_format_name: percent_2
  }

  measure: clients_shown_phishing_warning {
    label: "Clients Shown A Phishing Warning"
    type: count_distinct
    sql: CASE WHEN ${event_code} = 9 AND ${value} > 0 THEN ${metrics.client_info__client_id} END ;;
  }

  measure: clients_overrode_phishing_warning {
    label: "Clients Who Overrode A Phishing Warning"
    type: count_distinct
    sql: CASE WHEN ${event_code} = 12 AND ${value} > 0 THEN ${metrics.client_info__client_id} END ;;
  }

  # ---- malware, top-level page: comparison for the phishing numbers ----

  measure: malware_warnings_shown {
    label: "Malware Warnings Shown"
    description: "Code 1."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "1"]
  }

  measure: malware_warnings_overridden {
    label: "Malware Warnings Overridden"
    description: "Code 4."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "4"]
  }

  measure: malware_override_rate {
    label: "Malware Override Rate"
    type: number
    sql: SAFE_DIVIDE(${malware_warnings_overridden}, ${malware_warnings_shown}) ;;
    value_format_name: percent_2
  }

  # ---- every threat type, page and iframe ----

  measure: all_warnings_shown {
    label: "All Warnings Shown"
    type: sum
    sql: ${value} ;;
    filters: [ui_action: "Warning shown"]
  }

  measure: all_warnings_overridden {
    label: "All Warnings Overridden"
    type: sum
    sql: ${value} ;;
    filters: [ui_action: "Proceed anyway"]
  }

  measure: overall_override_rate {
    label: "Overall Override Rate"
    type: number
    sql: SAFE_DIVIDE(${all_warnings_overridden}, ${all_warnings_shown}) ;;
    value_format_name: percent_2
  }
}

# The lookup_hit / lookup_miss list names mix Safe Browsing lists with
# tracking-protection lists. Summing them without filtering blends unrelated
# things, so these views add a grouping column.
view: +metrics__metrics__labeled_counter__urlclassifier_lookup_hit {
  dimension: table_group {
    label: "List Group"
    type: string
    sql: CASE
           WHEN ${label} IN ('goog-phish-proto', 'googpub-phish-proto') THEN 'Phishing'
           WHEN ${label} = 'goog-malware-proto' THEN 'Malware'
           WHEN ${label} = 'goog-unwanted-proto' THEN 'Unwanted'
           WHEN ${label} = 'goog-harmful-proto' THEN 'Harmful'
           WHEN ${label} IN ('goog-badbinurl-proto', 'goog-downloadwhite-proto') THEN 'Download protection'
           WHEN ${label} LIKE 'test-%' THEN 'Test'
           ELSE 'Tracking protection / other'
         END ;;
  }

  dimension: is_safe_browsing {
    label: "Is Safe Browsing List"
    description: "Excludes tracking protection, fingerprinting, cryptomining, and test lists."
    type: yesno
    sql: ${label} IN (
      'goog-phish-proto', 'googpub-phish-proto', 'goog-malware-proto',
      'goog-unwanted-proto', 'goog-harmful-proto', 'goog-badbinurl-proto',
      'goog-downloadwhite-proto'
    ) ;;
  }

  # NOTE: this counts 4-byte prefix matches. Classifier.cpp:585 records the hit
  # before the full hash is confirmed, so it includes prefix collisions on
  # harmless sites. It is not a count of confirmed bad sites.
  #
  # It is also counted per list, and one navigation is checked against several
  # lists, so hits + misses counts list checks, not page loads.
  measure: prefix_match_count {
    label: "Prefix Match Count (not confirmed bad)"
    type: sum
    sql: ${value} ;;
  }
}

view: +metrics__metrics__labeled_counter__urlclassifier_lookup_miss {
  dimension: table_group {
    label: "List Group"
    type: string
    sql: CASE
           WHEN ${label} IN ('goog-phish-proto', 'googpub-phish-proto') THEN 'Phishing'
           WHEN ${label} = 'goog-malware-proto' THEN 'Malware'
           WHEN ${label} = 'goog-unwanted-proto' THEN 'Unwanted'
           WHEN ${label} = 'goog-harmful-proto' THEN 'Harmful'
           WHEN ${label} IN ('goog-badbinurl-proto', 'goog-downloadwhite-proto') THEN 'Download protection'
           WHEN ${label} LIKE 'test-%' THEN 'Test'
           ELSE 'Tracking protection / other'
         END ;;
  }

  dimension: is_safe_browsing {
    label: "Is Safe Browsing List"
    type: yesno
    sql: ${label} IN (
      'goog-phish-proto', 'googpub-phish-proto', 'goog-malware-proto',
      'goog-unwanted-proto', 'goog-harmful-proto', 'goog-badbinurl-proto',
      'goog-downloadwhite-proto'
    ) ;;
  }

  measure: lookup_miss_count {
    label: "Lookup Miss Count"
    type: sum
    sql: ${value} ;;
  }
}

# Download protection verdicts. A second Safe Browsing signal, and the only
# place Firefox records a per-item server verdict.
#
# The codes map to the ClientDownloadResponse verdict enum in
# toolkit/components/reputationservice/chromium/.../csd.proto. I have not read
# that file, so the raw code is exposed rather than guessed at.
view: +metrics__metrics__custom_distribution__application_reputation_server_verdict__values {
  label: "Safe Browsing: Download Verdict"

  dimension: verdict_code {
    label: "Verdict Code (unmapped)"
    description: "Raw code. Maps to the csd.proto ClientDownloadResponse verdict enum; mapping not yet transcribed."
    type: number
    sql: SAFE_CAST(${TABLE}.key AS INT64) ;;
  }

  dimension: key {
    hidden: yes
  }

  dimension: value {
    hidden: yes
  }

  measure: verdict_count {
    label: "Verdict Count"
    type: sum
    sql: ${value} ;;
  }
}
