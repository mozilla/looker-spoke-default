include: "../views/survey_lifecycle_28d_desktop.view"
include: "../views/survey_lifecycle_28d_mobile.view"

explore: survey_lifecycle_28d_desktop {
  join: survey_lifecycle_28d_desktop__survey_data {
    view_label: "Survey Lifecycle 28d Desktop: Survey Data"
    sql: LEFT JOIN UNNEST(${survey_lifecycle_28d_desktop.survey_data}) as survey_lifecycle_28d_desktop__survey_data ;;
    relationship: one_to_many
  }
}

explore: survey_lifecycle_28d_mobile {
  join: survey_lifecycle_28d_mobile__survey_data {
    view_label: "Survey Lifecycle 28d Mobile: Survey Data"
    sql: LEFT JOIN UNNEST(${survey_lifecycle_28d_mobile.survey_data}) as survey_lifecycle_28d_mobile__survey_data ;;
    relationship: one_to_many
  }
}
