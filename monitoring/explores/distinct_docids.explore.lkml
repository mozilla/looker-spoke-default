include: "../views/distinct_docids.view.lkml"


explore: distinct_docids {
  sql_always_where: ${distinct_docids.submission_date} >= '2010-01-01' ;;
  description:
  "
  The table lists all doctypes where the number
  of distinct doc ids doesn't match between decoded, live, and stable.
  non_matching_count is the number of non-matching doctypes on the given day.

  As of 2021-05-02, we filter out all pings containing
  \"automation\" in the X-Source-Tags header, so these counts
  may appear lower in some cases compared to a direct
  COUNT(DISTINCT document_id) on the relevant table partition.
  Prior to adding this filtering, document types under
  org_mozilla_fenix would consistently show mismatches due
  to test pings present in the decoded and live tables.
  "

  join: non_matching {
    relationship: one_to_many
    sql: LEFT JOIN non_matching USING(submission_date) ;;
  }

  always_filter: {
    filters: [
      submission_date: "3 years",
      non_matching.non_matching_count: "> 0",
    ]
  }
}
