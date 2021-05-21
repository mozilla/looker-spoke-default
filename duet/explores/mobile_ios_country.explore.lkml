include: "../views/*.view.lkml"

explore: mobile_ios_country {
  join: country_buckets {
    type: inner
    relationship: many_to_one
    sql_on:  ${country_buckets.code} = ${mobile_ios_country.country} ;;
  }
  always_filter: {
    filters: [
      country_buckets.bucket: "Overall"
    ]
  }
}
