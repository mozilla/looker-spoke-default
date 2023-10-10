include: "//looker-hub/monitoring/views/airflow_dag_tag.view.lkml"

view: +airflow_dag_tag {

  dimension: dag_id {
    type: string
    description: "Airflow DAG id"
    link: {
      label: "go to (sub-)DAG"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid"
    }
    primary_key: yes
  }

  dimension: tags {
    hidden: yes
    type: number
  }

  dimension: impact {
    type: string
    sql:
      case
        when exists(select tag from unnest(${tags}) as tag where tag like "impact/%")
        then (select split(tag, "/")[safe_offset(1)] from unnest(${tags}) as tag where tag like "impact/%" limit 1)
        else "not specified"
      end
    ;;
  }

  dimension: repo {
    type: string
    sql:
      case
        when exists(select tag from unnest(${tags}) as tag where tag like "repo/%")
        then (select split(tag, "/")[safe_offset(1)] from unnest(${tags}) as tag where tag like "repo/%" limit 1)
        else "not specified"
      end
    ;;
  }

  dimension: triage {
    type: string
    sql:
      case
        when exists(select tag from unnest(${tags}) as tag where tag like "triage/%")
        then (select split(tag, "/")[safe_offset(1)] from unnest(${tags}) as tag where tag like "triage/%" limit 1)
        else "not specified"
      end
    ;;
  }

  measure: count {
    type: count
  }

}
