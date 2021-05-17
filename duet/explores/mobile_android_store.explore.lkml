include: "../views/*.view.lkml"

explore: mobile_android_store {
  sql_always_where:
    package_name in (
      "org.mozilla.firefox_beta"
    ) ;;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: (
      -- the country names recorded in the table are manaully mapped to the correct bucket
      (${country_buckets.code} = "US" AND ${mobile_android_store.country} = "US" ) OR
      (${country_buckets.code} = "GB" AND ${mobile_android_store.country} = "GB") OR
      (${country_buckets.code} = "DE" AND ${mobile_android_store.country} = "DE") OR
      (${country_buckets.code} = "FR" AND ${mobile_android_store.country} = "FR") OR
      (${country_buckets.code} = "CA" AND ${mobile_android_store.country} = "CA") OR
      (${country_buckets.code} = "BR" AND ${mobile_android_store.country} = "BR") OR
      (${country_buckets.code} = "MX" AND ${mobile_android_store.country} = "MX") OR
      (${country_buckets.code} = "CN" AND ${mobile_android_store.country} = "CN") OR
      -- not quite sure this this behaves as expected...
      (
        ${mobile_android_store.country} NOT IN ("US", "GB", "DE", "FR", "CA", "BR", "MX", "CN") AND
        ${country_buckets.bucket} IN ("non-tier-1", "Overall") AND ${country_buckets.code} = "OTHER" )
      );;
  }

  query: total_installs {
    dimensions: [country_buckets.bucket]
    measures: [mobile_android_store.total_installs]
    filters: [
      mobile_android_store.date: "28 days",
      mobile_android_store.ignore_most_recent_week: "No",
      mobile_android_store.join_field: "yes"
    ]
    label: "Total installs"
  }

  query: total_visits {
    dimensions: [country_buckets.bucket]
    measures: [mobile_android_store.total_visitors]
    filters: [
      mobile_android_store.date: "28 days",
      mobile_android_store.ignore_most_recent_week: "No",
      mobile_android_store.join_field: "yes"
    ]
    label: "Total visits"
  }
}
