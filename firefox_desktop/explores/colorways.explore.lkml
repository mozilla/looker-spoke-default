
include: "../views/colorways.view.lkml"

explore: colorways {
  view_name: colorways
  description: "Basic stats about colorways usage. Only supports daily-level data."

  always_filter: {
    filters: [
      submission_date: "after 2022-10-18",
    ]
  }
}
