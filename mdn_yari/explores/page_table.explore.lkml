include: "//looker-hub/mdn_yari/views/page_table.view.lkml"

explore: page_table {
  sql_always_where: ${page_table.submission_date} >= '2010-01-01' ;;
  view_label: "Page Table"
  description: "Explore for the page ping. A ping that will be sent everytime a new page is visited."
  view_name: page_table

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
