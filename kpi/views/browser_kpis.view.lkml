# derived table for simplified tracking of (Q)CDOU. Users looking to drill down should use the upstream explore, `browser_dau`

view: browser_kpis {
  derived_table: {
    explore_source: browser_dau {
      column: submission {
        field: browser_dau.submission_date
      }
      column: platform {
        field: browser_dau.platform
      }
      column: dau {
        field: browser_dau.total_user_count
      }
    filters: [browser_dau.client_qualifies: "yes"]
    }
  }

  dimension_group: submission {
    sql: DATE(${TABLE}.submission) ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: platform {
    sql: ${TABLE}.platform ;;
    label: "Platform (Firefox Desktop or Mobile)"
    description: "'Firefox Desktop' or 'Firefox Mobile'"
  }

  measure: dau {
    type: sum
    label: "Qualified Days of Use (Daily Active Users)"
    description: "This counts QCDOU for Desktop and CDOU for Mobile."
    sql: ${TABLE}.dau ;;
  }
}
