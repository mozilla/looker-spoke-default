view: colorways {
  derived_table: {
    sql: -- basic example of how to set a variable in the BQ scripting language
-- https://cloud.google.com/bigquery/docs/reference/standard-sql/procedural-language#declare
DECLARE start_date DATE DEFAULT DATE(2022, 10, 18);

WITH indp_voices_colorways AS
  (SELECT *
   FROM UNNEST (["visionary-balanced-colorway@mozilla.org",
   "visionary-bold-colorway@mozilla.org",
         "visionary-soft-colorway@mozilla.org",
         "playmaker-balanced-colorway@mozilla.org",
         "playmaker-bold-colorway@mozilla.org",
         "playmaker-soft-colorway@mozilla.org",
         "innovator-balanced-colorway@mozilla.org",
         "innovator-bold-colorway@mozilla.org",
         "innovator-soft-colorway@mozilla.org",
         "expressionist-balanced-colorway@mozilla.org",
         "expressionist-bold-colorway@mozilla.org",
         "expressionist-soft-colorway@mozilla.org",
         "dreamer-balanced-colorway@mozilla.org",
         "dreamer-bold-colorway@mozilla.org",
         "dreamer-soft-colorway@mozilla.org",
         "activist-balanced-colorway@mozilla.org",
         "activist-bold-colorway@mozilla.org",
         "activist-soft-colorway@mozilla.org"])),
 currently_set AS
  (SELECT DATE(submission_timestamp) AS submission_date,
          SPLIT(environment.addons.theme.id, '-colorway')[OFFSET(0)] AS id,
          100 * COUNT(DISTINCT client_id) AS clients_currently_set
   FROM telemetry.main_1pct -- these tables that end in _1pct are random 1 percent samples (based on client_id) of their parent tables. they speed things up when that's all you need.

   WHERE DATE(submission_timestamp) >= start_date
     AND environment.addons.theme.id IN
       (SELECT *
        FROM indp_voices_colorways)
     AND environment.addons.theme.user_disabled IS NOT TRUE -- this is just to be safe, it doesn't seem to happen much at all in practice

   GROUP BY 1,
            2 -- ORDER BY 2 DESC
 ), -- themes set today according to telemetry events
 -- https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/collection/events.html#eventtelemetry
 -- see https://searchfox.org/mozilla-central/source/toolkit/components/telemetry/Events.yaml#185
 -- this means that it was set at anytime, including clients just trying it in the modal. they don't have to actuall set it "permanently" for this event to fire
 play_today AS
  (SELECT submission_date,
          SPLIT(event_string_value, '-colorway')[OFFSET(0)] AS id,
          100 * COUNT(DISTINCT client_id) AS clients_play_today
   FROM telemetry.events_1pct
   WHERE submission_date >= start_date
     AND event_string_value IN
       (SELECT *
        FROM indp_voices_colorways)
     AND event_category = 'addonsManager'
     AND event_method = 'enable'
     AND event_object = 'theme'
   GROUP BY 1,
            2 -- ORDER BY 2 DESC
 ), -- themes actually selected AND set in the modal, so the theme was actually set durably.
 -- see https://searchfox.org/mozilla-central/source/toolkit/components/telemetry/Events.yaml#3447
 set_today AS
  (SELECT submission_date,
          SPLIT(e.value, '-colorway')[OFFSET(0)] AS id,
          100 * COUNT(DISTINCT client_id) AS clients_set_today
   FROM telemetry.events_1pct
   CROSS JOIN UNNEST(event_map_values) e
   WHERE submission_date >= start_date
     AND e.value IN
       (SELECT *
        FROM indp_voices_colorways)
     AND e.key = 'colorway_id'
     AND event_category = 'colorways_modal'
     AND event_method = 'set_colorway'
   GROUP BY 1,
            2)
SELECT *
FROM currently_set
LEFT JOIN play_today USING(submission_date,
                          id)
LEFT JOIN set_today USING(submission_date,
                               id)
ORDER BY submission_date, id
       ;;
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: clients_currently_set {
    type: sum
    sql: ${TABLE}.clients_currently_set ;;
  }

  measure: clients_play_today {
    type: sum
    sql: ${TABLE}.clients_play_today ;;
  }

  measure: clients_set_today {
    type: sum
    sql: ${TABLE}.clients_set_today ;;
  }

  set: detail {
    fields: [submission_date, id, clients_currently_set, clients_play_today, clients_set_today]
  }
}
