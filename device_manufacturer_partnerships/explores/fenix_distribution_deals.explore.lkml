include: "/device_manufacturer_partnerships/views/fenix_distribution_deals.view.lkml"
include: "/device_manufacturer_partnerships/views/fenix_preload_and_open.view.lkml"

explore: fenix_distribution_deals {
  view_name: fenix_distribution_deals

  join: fenix_preload_and_open {
    type: left_outer
    relationship: one_to_one
    sql_on: ${fenix_distribution_deals.country_code} = ${fenix_preload_and_open.country_code} 
    AND ${fenix_distribution_deals.distribution_id} = ${fenix_preload_and_open.distribution_id} ;;
  }

}
