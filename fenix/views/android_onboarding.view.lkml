include: "//looker-hub/fenix/views/android_onboarding.view.lkml"

view: +android_onboarding {

  # hide dimensions that we will use as measures
  dimension: new_profile {
    hidden: yes
  }

  dimension: first_card_impression {
    hidden: yes
  }

  dimension: first_card_primary_click {
    hidden: yes
  }

  dimension: first_card_secondary_click {
    hidden: yes
  }

  dimension: second_card_impression {
    hidden: yes
  }

  dimension: second_card_primary_click {
    hidden: yes
  }

  dimension: second_card_secondary_click {
    hidden: yes
  }

  dimension: third_card_impression {
    hidden: yes
  }

  dimension: third_card_primary_click {
    hidden: yes
  }

  dimension: third_card_secondary_click {
    hidden: yes
  }

  dimension: onboarding_completed {
    hidden: yes
  }

  dimension: sync_sign_in {
    hidden: yes
  }

  dimension: default_browser {
    hidden: yes
  }

  dimension: funnel {
    hidden: yes
  }

  # define measures

  measure: new_profile_measure {
    sql: ${TABLE}.new_profile ;;
    type: sum
    label: "New Profiles (Count)"
    description: "Total number of new profiles. Not all of them will have gone through or been assigned an onboarding funnel."
  }

  measure: first_card_impression_measure {
    sql: ${TABLE}.first_card_impression ;;
    type: sum
    label: "First Card Impression (Count of Users)"
    description: "Number of users with an impression on the first card."
  }

  measure: first_card_primary_click_measure {
    sql: ${TABLE}.first_card_primary_click ;;
    type: sum
    label: "First Card Primary Click (Count of Users)"
    description: "Number of users with a click on the primary button of the first card."
  }

  measure: first_card_secondary_click_measure {
    sql: ${TABLE}.first_card_secondary_click ;;
    type: sum
    label: "First Card Secondary Click (Count of Users)"
    description: "Number of users with a click on the secondary button of the first card. (This is almost always the 'skip' button)"
  }

  measure: second_card_impression_measure {
    sql: ${TABLE}.second_card_impression ;;
    type: sum
    label: "Second Card Impression (Count of Users)"
    description: "Number of users with an impression on the second card."
  }

  measure: second_card_primary_click_measure {
    sql: ${TABLE}.second_card_primary_click ;;
    type: sum
    label: "Second Card Primary Click (Count of Users)"
    description: "Number of users with a click on the primary button of the second card."
  }

  measure: second_card_secondary_click_measure {
    sql: ${TABLE}.second_card_secondary_click ;;
    type: sum
    label: "Second Card Secondary Click (Count of Users)"
    description: "Number of users with a click on the secondary button of the second card. (This is almost always the 'skip' button)"
  }

  measure: third_card_impression_measure {
    sql: ${TABLE}.third_card_impression ;;
    type: sum
    label: "Third Card Impression (Count of Users)"
    description: "Number of users with an impression on the third card."
  }

  measure: third_card_primary_click_measure {
    sql: ${TABLE}.third_card_primary_click ;;
    type: sum
    label: "Third Card Primary Click (Count of Users)"
    description: "Number of users with a click on the primary button of the third card."
  }

  measure: third_card_secondary_click_measure {
    sql: ${TABLE}.third_card_secondary_click ;;
    type: sum
    label: "Third Card Secondary Click (Count of Users)"
    description: "Number of users with a click on the secondary button of the third card. (This is almost always the 'skip' button)"
  }

  measure: onboarding_completed_measure {
    sql: ${TABLE}.onboarding_completed ;;
    type: sum
    label: "Clients Completing Onboarding"
    description: "Total number of new profiles generating the onboarding completed event."
  }

  measure: sync_sign_in_measure {
    sql: ${TABLE}.sync_sign_in ;;
    type: sum
    label: "Clients Signing into Sync"
    description: "Total number of new profiles signing into sync. Could be either a login or signup."
  }

  measure: default_browser_measure {
    sql: ${TABLE}.default_browser ;;
    type: sum
    label: "Clients Setting Default"
    description: "Total number of new profiles setting Firefox as default."
  }

}
