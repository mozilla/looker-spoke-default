include: "../views/relay_mask_firefox_retention.view.lkml"

explore: relay_mask_firefox_retention {
  label: "Relay Masks vs Firefox Retention"
  description: "Firefox Desktop 4th-week retention segmented by Relay mask count.
    Shows CORRELATION only — not causation. Users who create masks
    are likely more engaged to begin with."

  always_filter: {
    filters: [
      relay_mask_firefox_retention.submission_date: "56 days ago for 28 days",
    ]
  }
}
