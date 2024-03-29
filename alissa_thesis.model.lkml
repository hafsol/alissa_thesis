connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: alissa_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alissa_thesis_default_datagroup

explore: cities {
  hidden: yes
}

explore: parks {
  group_label: "TSR Thesis: US National Parks"
  label: "National Parks and Species"
  join: species {
    type: left_outer
    sql_on: ${species.park_name} = ${parks.park_name} ;;
    relationship: many_to_one
  }
  join: park_acre_ranking {
    type: inner
    sql_on: ${parks.park_code} = ${park_acre_ranking.park_code} ;;
    relationship: one_to_one
  }

}

explore: species {
  hidden: yes
  label: "Species Questions"
  join: parks {
    type: left_outer
    sql_on: ${species.park_name} = ${parks.park_name} ;;
    relationship: many_to_one
  }
  join: park_acre_ranking {
    type: inner
    sql_on: ${parks.park_code} = ${park_acre_ranking.park_code} ;;
    relationship: one_to_one
  }
  # join: cities {
  #   sql_on: ${cities.state_name} = ${parks.state} ;;
  # }
}

map_layer: natparks {
  file: "natparks.topojson"
  property_key: "UNIT_CODE"
}
