include: "//looker-hub/monitoring/views/airflow_dag_run.view.lkml"

view: +airflow_dag_run {

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${dag_id}, ${execution_raw}) ;;
    hidden: yes
  }

  dimension: dag_id {
    type: string
    link: {
      label: "go to (sub-)DAG"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid"
    }
  }

  dimension_group: run_time {
    type: duration
    sql_start:  ${start_raw} ;;
    sql_end: ${end_raw} ;;
    intervals: [
      second,
      minute,
      hour,
      day
    ]
  }

  measure: last_runs {
    type: string
    sql: array_agg(struct(${state}, ${execution_time} as execution_time, ${start_time} as start_time, ${end_time} as end_time) order by execution_date desc limit 3) ;;
    hidden: yes
  }

  measure: run_1 {
    type: string
    sql: ${last_runs}[safe_offset(0)].execution_time ;;
    html:
    {% for run in last_runs._value offset:0 limit:1 %}
    <a title="state: {{ run.state }}&#10;execution_time: {{ run.execution_time }}&#10;start_time: {{ run.start_time}}&#10;end_time: {{ run.end_time }}">
    {% if run.state == "success" %}
    <p><img src="https://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{rendered_value}}</p>
    {% elsif run.state == "failed" %}
    <p><img src="https://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20>{{ rendered_value }}</p>
    {% else %}
    <p><img src="https://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20>{{ rendered_value }}</p>
    {% endif %}
    </a>
    {% endfor %}
    ;;
  }

  measure: run_2 {
    type: string
    sql: ${last_runs}[safe_offset(1)].execution_time ;;
    html:
      {% for run in last_runs._value offset:1 limit:1 %}
      <a title="state: {{ run.state }}&#10;execution_time: {{ run.execution_time }}&#10;start_time: {{ run.start_time}}&#10;end_time: {{ run.end_time }}">
      {% if run.state == "success" %}
        <p><img src="https://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{rendered_value}}</p>
      {% elsif run.state == "failed" %}
        <p><img src="https://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20>{{ rendered_value }}</p>
      {% else %}
        <p><img src="https://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20>{{ rendered_value }}</p>
      {% endif %}
      </a>
      {% endfor %}
    ;;
  }

  measure: run_3 {
    type: string
    sql: ${last_runs}[safe_offset(2)].execution_time ;;
    html:
      {% for run in last_runs._value offset:2 limit:1 %}
      <a title="state: {{ run.state }}&#10;execution_time: {{ run.execution_time }}&#10;start_time: {{ run.start_time}}&#10;end_time: {{ run.end_time }}">
      {% if run.state == "success" %}
        <p><img src="https://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{rendered_value}}</p>
      {% elsif run.state == "failed" %}
        <p><img src="https://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20>{{ rendered_value }}</p>
      {% else %}
        <p><img src="https://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20>{{ rendered_value }}</p>
      {% endif %}
      </a>
      {% endfor %}
    ;;
  }

  measure: failed_last_7_days {
    type: sum
    sql: if(${state} = "failed", 1, 0) ;;
    filters: [execution_date: "7 days ago for 7 days"]
  }

  measure: avg_execution_time_sec {
    type: average
    sql: ${seconds_run_time};;
    value_format: "0"
  }

  measure: avg_execution_time_last_7_days_sec {
    type: average
    sql: ${seconds_run_time} ;;
    value_format: "0"
    filters: [execution_date: "7 days ago for 7 days"]
  }

  measure: sum_failures {
    type: sum
    sql: if(${state} = "failed", 1, 0) ;;
    label: "Number of Failures"
    description: "Number showing how often the DAG has failed within the selected time frame"
  }

  measure: days_since_last_failure {
    type: number
    sql: date_diff(current_date(), max(if(state = "failed", date(execution_date), null)), day) ;;
    description: "How many days ago was the last failure of this DAG. NULL if the last failure is outside the selected time frame. Note that the data is not as fresh as in Airflow itself."
  }

  measure: days_since_last_run {
    type: number
    sql: date_diff(current_date(), date(max(execution_date)), day) ;;
    description: "How many days ago was the last run for this DAG shown in this dashboard. This will often be 1 even if the DAG did run today, but after the ETL for this dashboard ran."
  }

}
