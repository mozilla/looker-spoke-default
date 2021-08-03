include: "//looker-hub/firefox_accounts/views/growth_accounting.view.lkml"

view: +growth_accounting {
  dimension_group: first_run {
    type: time
    sql: ${fxa_first_seen_table.first_seen_raw} ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
    ]
  }

  dimension: new_this_week {
    sql: DATE_DIFF(${submission_date}, ${first_run_date}, DAY) BETWEEN 0 AND 6 ;;
    type: yesno
    hidden: yes
  }

  dimension: new_last_week {
    sql: DATE_DIFF(${submission_date}, ${first_run_date}, DAY) BETWEEN 7 AND 13 ;;
    type: yesno
    hidden: yes
  }
}
