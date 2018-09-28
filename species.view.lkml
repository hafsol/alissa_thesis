view: species {
  sql_table_name: biodiversity_in_parks.species ;;

  dimension: species_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Species_ID ;;
  }

  dimension: abundance {
    type: string
    sql: ${TABLE}.Abundance ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: order {
    group_label: "Scientific Classification"
    description: "The scientific order the species belongs to."
    type: string
    sql: ${TABLE}.`Order` ;;
  }

  dimension: family {
    group_label: "Scientific Classification"
    description: "The scientific family the species belongs to."
    type: string
    sql: ${TABLE}.Family ;;
  }

  dimension: scientific_name {
    group_label: "Scientific Classification"
    description: "Full scientific species name"
    type: string
    sql: ${TABLE}.Scientific_Name ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://www.google.com/s2/favicons?domain=www.google.com" height=15 width=15> </a> ;;
  }

  dimension: common_names {
    label: "Common Name"
    type: string
    sql: ${TABLE}.Common_Names ;;
  }


  dimension: conservation_status {
    description: "IUCN species conservation status."
    type: string
    sql: ${TABLE}.Conservation_Status ;;
  }


  dimension: ignore_me {
    hidden: yes
    type: string
    sql: ${TABLE}.ignore_me ;;
  }

  dimension: nativeness {
    type: string
    sql: ${TABLE}.Nativeness ;;
  }

  dimension: occurrence {
    type: string
    sql: ${TABLE}.Occurrence ;;
  }


  dimension: park_name {
    description: "Park in which the species appears."
    type: string
    sql: ${TABLE}.Park_Name ;;
    link: {
      label: "View park profile"
      url: "https://productday.dev.looker.com/dashboards/221"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "View the profile for this park on www.nps.gov"
      url: "https://www.nps.gov/{{ parks.park_code._value }}/index.htm"
      icon_url: "https://www.google.com/s2/favicons?domain=www.nps.gov"
    }
  }

  dimension: record_status {
    type: string
    sql: ${TABLE}.Record_Status ;;
  }

  dimension: seasonality {
    description: "When the species can be found in the park. Null (blank) if the species is found there year-round."
    type: string
    sql: ${TABLE}.Seasonality ;;
  }


## measures

  measure: count {
    type: count
  }

  measure: count_species {
    type: count
    drill_fields: [species_drill*]
  }

  measure: count_species_endangered {
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.conservation_status
      value: "Endangered"
    }
  }


  set:  species_drill {
    fields: [
      common_names,
      scientific_name
    ]
  }

}
