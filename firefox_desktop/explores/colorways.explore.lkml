
include: "../views/colorways.view.lkml"

explore: colorways {
  view_name: colorways
  description: "Basic stats about colorways usage."

  always_filter: {
    filters: [
      submission_date: "after 2022-10-17",
    ]
  }
}
