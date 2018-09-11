connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: alissa_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alissa_thesis_default_datagroup

explore: cities {}

explore: parks {}

explore: species {
  label: "Species Questions"
  join: parks {
    type: left_outer
    sql_on: ${species.park_name} = ${parks.park_name} ;;
    relationship: many_to_one
  }
}
