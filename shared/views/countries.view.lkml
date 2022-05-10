include: "//looker-hub/shared/views/countries.view"

view: +countries {

  dimension: tier {
    type: string
    sql:
      CASE
      WHEN
        ${TABLE}.code IN ('US', 'CA', 'DE', 'FR', 'GB') THEN 'Tier 1'
      ELSE 'Other'
      END ;;

    description: "Country tier, as used in relation to browser KPIs. The specific meaning of Tier 1 may vary across different products."
  }
}
