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
    description: "Which button the user pressed. In practice only 'Leave site' and 'Proceed anyway' ever appear -- Firefox does not record 'Warning shown' or 'Why blocked'. Both are kept here because the IDL defines them."
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

  # IMPORTANT: only TWO of the 32 codes are ever recorded.
  #
  # BlockedSiteParent.sys.mjs:151-170 accumulates on exactly two button presses:
  # goBackButton -> *_GET_ME_OUT_OF_HERE, and ignore_warning_link ->
  # *_IGNORE_WARNING. The *_PAGE_TOP ("warning shown") and *_WHY_BLOCKED
  # constants exist in the IDL but nothing accumulates them.
  #
  # Confirmed against 7 days of release data (2026-08-05..11): the only nonzero
  # codes were 3, 4, 11, 12, 15, 16, 19, 20, 24 -- every one a leave-site or an
  # override.
  #
  # So this probe CANNOT give a true bypass rate. There is no denominator for
  # warnings displayed. What it gives is the split between the two buttons among
  # users who pressed one. Users who saw the warning and silently closed the tab
  # or navigated away are invisible here.
  #
  # Measures are named "share" rather than "rate" to keep that distinction.

  measure: event_count {
    label: "Event Count"
    description: "How many times these events happened. Slice by Threat Type, Scope, and UI Action."
    type: sum
    sql: ${value} ;;
  }

  # ---- phishing, top-level page ----

  measure: phishing_overrode {
    label: "Phishing: Proceeded Anyway"
    description: "Code 12. User pressed the override link and continued to the site."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "12"]
  }

  measure: phishing_left_site {
    label: "Phishing: Left Site"
    description: "Code 11. User pressed 'Get me out of here'."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "11"]
  }

  measure: phishing_interactions {
    label: "Phishing: Button Presses"
    description: "Codes 11 + 12. NOT the number of warnings shown, which is not recorded."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "11,12"]
  }

  measure: phishing_override_share {
    label: "Phishing Override Share"
    description: "Proceeded Anyway / Button Presses. Share of INTERACTING users who overrode. Not a bypass rate -- silent leavers are not counted."
    type: number
    sql: SAFE_DIVIDE(${phishing_overrode}, ${phishing_interactions}) ;;
    value_format_name: percent_2
  }

  measure: clients_overrode_phishing {
    label: "Clients Who Overrode A Phishing Warning"
    type: count_distinct
    sql: CASE WHEN ${event_code} = 12 AND ${value} > 0 THEN ${metrics.client_info__client_id} END ;;
  }

  measure: clients_left_phishing {
    label: "Clients Who Left A Phishing Warning"
    type: count_distinct
    sql: CASE WHEN ${event_code} = 11 AND ${value} > 0 THEN ${metrics.client_info__client_id} END ;;
  }

  measure: phishing_overrides_per_client {
    label: "Phishing Overrides Per Overriding Client"
    description: "Whether overriding is a one-off or a habit."
    type: number
    sql: SAFE_DIVIDE(${phishing_overrode}, ${clients_overrode_phishing}) ;;
    value_format: "0.00"
  }

  # ---- malware and unwanted, top-level page: comparison ----

  measure: malware_overrode {
    label: "Malware: Proceeded Anyway"
    description: "Code 4."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "4"]
  }

  measure: malware_interactions {
    label: "Malware: Button Presses"
    description: "Codes 3 + 4."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "3,4"]
  }

  measure: malware_override_share {
    label: "Malware Override Share"
    type: number
    sql: SAFE_DIVIDE(${malware_overrode}, ${malware_interactions}) ;;
    value_format_name: percent_2
  }

  measure: unwanted_overrode {
    label: "Unwanted: Proceeded Anyway"
    description: "Code 20."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "20"]
  }

  measure: unwanted_interactions {
    label: "Unwanted: Button Presses"
    description: "Codes 19 + 20."
    type: sum
    sql: ${value} ;;
    filters: [event_code: "19,20"]
  }

  measure: unwanted_override_share {
    label: "Unwanted Override Share"
    type: number
    sql: SAFE_DIVIDE(${unwanted_overrode}, ${unwanted_interactions}) ;;
    value_format_name: percent_2
  }

  # ---- every threat type, page and iframe ----

  measure: all_overrode {
    label: "All: Proceeded Anyway"
    type: sum
    sql: ${value} ;;
    filters: [ui_action: "Proceed anyway"]
  }

  measure: all_left_site {
    label: "All: Left Site"
    type: sum
    sql: ${value} ;;
    filters: [ui_action: "Leave site"]
  }

  measure: overall_override_share {
    label: "Overall Override Share"
    description: "Proceeded Anyway / (Proceeded Anyway + Left Site), all threat types."
    type: number
    sql: SAFE_DIVIDE(${all_overrode}, ${all_overrode} + ${all_left_site}) ;;
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
           WHEN ${label} = 'goog-badbinurl-proto' THEN 'Malicious download'
           WHEN ${label} IN ('goog-downloadwhite-proto', 'google-trackwhite-digest256', 'mozstd-trackwhite-digest256') THEN 'Allowlist (a hit means KNOWN GOOD)'
           WHEN ${label} LIKE 'test-%' THEN 'Test'
           ELSE 'Tracking protection / other'
         END ;;
  }

  dimension: is_threat_list {
    label: "Is Threat List"
    description: "Threat lists only. Excludes ALLOWLISTS (downloadwhite, trackwhite), tracking protection, fingerprinting, cryptomining, and test lists."
    type: yesno
    sql: ${label} IN (
      'goog-phish-proto', 'googpub-phish-proto', 'goog-malware-proto',
      'goog-unwanted-proto', 'goog-harmful-proto', 'goog-badbinurl-proto'
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
           WHEN ${label} = 'goog-badbinurl-proto' THEN 'Malicious download'
           WHEN ${label} IN ('goog-downloadwhite-proto', 'google-trackwhite-digest256', 'mozstd-trackwhite-digest256') THEN 'Allowlist (a hit means KNOWN GOOD)'
           WHEN ${label} LIKE 'test-%' THEN 'Test'
           ELSE 'Tracking protection / other'
         END ;;
  }

  dimension: is_threat_list {
    label: "Is Threat List"
    type: yesno
    sql: ${label} IN (
      'goog-phish-proto', 'googpub-phish-proto', 'goog-malware-proto',
      'goog-unwanted-proto', 'goog-harmful-proto', 'goog-badbinurl-proto'
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
