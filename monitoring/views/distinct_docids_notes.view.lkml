include: "//looker-hub/monitoring/views/distinct_docids_notes.view.lkml"

view: +distinct_docids_notes {

  # Dimensions
  dimension: bug {
    hidden:  yes
  }

  dimension: bug_link {
    label: "Bug"
    type: string
    sql:
      CASE
        WHEN ${bug} IS NOT null THEN CONCAT("Bug ", SPLIT(${bug}, "=")[OFFSET(1)])
        ELSE ""
      END
      ;;
    link: {
      label: "{% if value != '' %} view on BugZilla {% endif %}"
      url: "
      {% if value != '' %}
      {{ bug }}
      {% endif %}"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }
}
