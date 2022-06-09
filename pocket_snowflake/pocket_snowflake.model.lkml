connection: "pocket-snowflake"
label: "Pocket"
include: "views/*"

explore: new_tab_advertising_rates {
  description: "Pocket New Tab Advertising Rates"
}

explore: pocket_hits_monthly_newsletter_advertising_rates {
  description: "Pocket Monthly Newsletter Advertising Rates"
}

explore: monthly_revenue {
  description: "Pocket Montly Revenue"
}

explore: pocket_hits_r4_w_avg_click_counts {
  description: "Pocket Hits R4w Average Click Counts"
  always_filter: {
    filters: [pocket_hits_r4_w_avg_click_counts.current_year_only: "yes"]
  }
}
