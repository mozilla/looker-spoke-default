include: "distinct_docids.view.lkml"

view: +distinct_docids {

  dimension: document_type {
    type: string
    sql: ${doc_type} ;;
  }
  measure: n_documents{
    type:  sum
    sql: (${stable}) ;;
  }
  }
