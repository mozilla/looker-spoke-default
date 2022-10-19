include: "../views/*.view.lkml"
include: "/shared/views/*"

explore: felt_privacy_pinned_retention_2_week {
  label: "Pinned PBM 2-week Retention"
  description: "Pinned PBM 2-week Retention"
  group_label: "MR 2022 Explores"
  hidden: yes
}

explore: fx_view_customization {
  label: "Firefox View Customization (Add & Remove)"
  description: "Counts of Clients Adding and Removing Fx View"
  group_label: "MR 2022 Explores"
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${fx_view_customization.country} = ${countries.code} ;;
  }
}
