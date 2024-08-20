connection: "telemetry"
label: "Marketing"

include: "explores/acoustic_contact_current_snapshot.explore.lkml"
include: "explores/acoustic_contacts.explore.lkml"
include: "explores/acoustic_email_events.explore.lkml"
include: "explores/firefox_for_families_campaign_results.explore.lkml"
include: "explores/firefox_for_families_forecasted_expectations.explore.lkml"
include: "views/mozmark_dau.view.lkml"

explore: mozmark_dau {}
