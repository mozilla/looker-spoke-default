# Safe Browsing interstitials — MNTOR-5334.
#
# Thin view over firefox_desktop.safe_browsing_interstitials, built in
# bigquery-etl. All the decoding lives there, with data checks that alarm if the
# Firefox source mappings drift. This file only names columns and forms ratios.
#
# READ THIS BEFORE QUOTING A RATE. "Warnings shown" counts renders of the
# about:blocked page, not distinct times a user met a warning. A blocked URL is
# never cache-tagged, so every reload and session restore re-renders and
# re-counts. Warnings shown per client run about 1.7-2.1 where one warning would
# be 1.0. Every rate below is therefore a LOWER BOUND on the real per-encounter
# rate, and the inflation cannot be divided out.
view: safe_browsing_interstitials {
  sql_table_name: `mozdata.firefox_desktop.safe_browsing_interstitials` ;;

  dimension_group: submission {
    label: "Submission"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.submission_date ;;
  }

  dimension: normalized_channel {
    label: "Channel"
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_os {
    label: "OS"
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: country {
    label: "Country"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: threat_type {
    label: "Threat Type"
    description: "Which Safe Browsing list triggered the block: Phishing, Malware, Unwanted, or Harmful."
    type: string
    sql: ${TABLE}.threat_type ;;
  }

  dimension: scope {
    label: "Scope"
    description: "Top-level page or iframe. Keep this matched when forming rates; iframe rows are rare."
    type: string
    sql: ${TABLE}.scope ;;
  }

  # ---- counts ----

  measure: displays {
    label: "Warnings Shown"
    description: "Renders of the about:blocked page. Inflated by reloads; see the view notes."
    type: sum
    sql: ${TABLE}.displays ;;
  }

  measure: display_clients {
    label: "Clients Shown A Warning"
    description: "Not additive across rows. Re-aggregating across dimensions double-counts."
    type: sum
    sql: ${TABLE}.display_clients ;;
  }

  measure: left_site {
    label: "Pressed Go Back"
    description: "Clicked the 'Go Back' button on the warning page. Undercounts heeding, because users who close the tab or navigate away are not recorded."
    type: sum
    sql: ${TABLE}.left_site ;;
  }

  measure: proceeded_anyway {
    label: "Overrode The Warning"
    description: "Clicked 'See Details' then the ignore-warning link, and continued to the blocked site."
    type: sum
    sql: ${TABLE}.proceeded_anyway ;;
  }

  measure: proceeded_anyway_clients {
    label: "Clients Who Overrode"
    type: sum
    sql: ${TABLE}.proceeded_anyway_clients ;;
  }

  measure: left_site_clients {
    label: "Clients Who Pressed Go Back"
    type: sum
    sql: ${TABLE}.left_site_clients ;;
  }

  # ---- rates, all lower bounds ----

  measure: override_rate {
    label: "Override Rate (lower bound)"
    description: "Overrides / warnings shown. A LOWER BOUND: the denominator counts reloads, so the true per-encounter rate is higher by an unknown factor."
    type: number
    sql: SAFE_DIVIDE(${proceeded_anyway}, ${displays}) ;;
    value_format_name: percent_2
  }

  measure: go_back_rate {
    label: "Go Back Rate (lower bound)"
    description: "Go Back presses / warnings shown. A floor on heeding, since silent departures are not recorded."
    type: number
    sql: SAFE_DIVIDE(${left_site}, ${displays}) ;;
    value_format_name: percent_2
  }

  measure: interaction_rate {
    label: "Any Button Pressed (lower bound)"
    description: "Share of renders that drew either button. The remainder are reloads or users who left without clicking."
    type: number
    sql: SAFE_DIVIDE(${left_site} + ${proceeded_anyway}, ${displays}) ;;
    value_format_name: percent_2
  }

  measure: displays_per_client {
    label: "Warnings Shown Per Client"
    description: "The reload inflation factor. One warning per client would be 1.0; observed values run 1.7-2.1."
    type: number
    sql: SAFE_DIVIDE(${displays}, ${display_clients}) ;;
    value_format: "0.00"
  }

  measure: overrides_per_overriding_client {
    label: "Overrides Per Overriding Client"
    description: "Whether overriding is a one-off or a habit."
    type: number
    sql: SAFE_DIVIDE(${proceeded_anyway}, ${proceeded_anyway_clients}) ;;
    value_format: "0.00"
  }
}
