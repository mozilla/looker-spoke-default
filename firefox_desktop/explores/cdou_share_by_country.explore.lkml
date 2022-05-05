include: "../views/cdou_share_by_country.view.lkml"

explore: CDOU_share_by_country {
  view_name: cdou_share_by_country

  always_filter: {
    filters: [
      date: "12 months",
      country: "AU, BR, CA, DE, ES, FR, GB, IN, IT, MX, US, JP"
    ]
  }

}
