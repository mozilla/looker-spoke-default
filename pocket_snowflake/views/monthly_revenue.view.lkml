view: monthly_revenue {
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."Y2022_MONTHLY_REVENUE"
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension_group: period {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HAPPENED_MONTH ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}."REVENUE" ;;
    value_format: "$#,###;($#,###)"
  }
}
