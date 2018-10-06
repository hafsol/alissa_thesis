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
    html:
        {% if value == "Crab/Lobster/Shrimp" %}
          <p style="color: black; background-color: #F39E70; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Algae" %}
          <p style="color: black; background-color: #659B5E; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Nonvascular Plant" %}
          <p style="color: white; background-color: #556F44; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Vascular Plant" %}
          <p style="color: black; background-color: #95BF74; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Spider/Scorpion" %}
          <p style="color: black; background-color: #daa520; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Fungi" %}
          <p style="color: black; background-color: #c0c1c4; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Fish" %}
          <p style="color: black; background-color: #48c5ce; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Mammal" %}
          <p style="color: black; background-color: #b28931; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Bird" %}
          <p style="color: black; background-color: #98cee0; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% else %}
          {{value}}
        {% endif %}
    ;;
  }

  dimension: category_image {
    type: string
    sql: ${category} ;;
    html:
        {% if value == "Bird" %}
          <img src="http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/1024/22271-bird-icon.png" style="width:50px;height:50px;" />
        {% elsif value == "Vascular Plant" %}
          <img src="https://avatanplus.com/files/resources/mid/56ea94de9ffa2153845585bf.png" style="width:75px;height:65px;" />
        {% elsif value == "Mammal" %}
          <img src="https://www.shareicon.net/data/128x128/2016/09/30/837623_bear_512x512.png" style="width:45px;height:45px;" />
        {% elsif value == "Fish" %}
          <img src="https://img.clipartxtras.com/599b9cf1ac083af16ca129f735eaff63_royalty-free-rainbow-trout-clip-art-vector-images-illustrations-trout-fish-clipart_858-1024.jpeg" style="width:50px;height:50px;" />
        {% else %}
          {{value}}
        {% endif %}
    ;;
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
    link: {
      label: "View species profile"
      url: "https://productday.dev.looker.com/dashboards/231?Species={{ value | url_encode }}"
      icon_url: "https://looker.com/favicon.ico"
    }

  }

  dimension: common_names {
    label: "Common Name"
    type: string
    sql: ${TABLE}.Common_Names ;;
    html: <p style="color: black; background-color: #D1BEB0; font-size: 140%; text-align:center">{{value}}</p> ;;
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

  dimension: is_native {
    type: yesno
    sql: ${nativeness} = "Native" ;;
    html:
          {% if value == 'Yes' %}
            <p style="color: black; background-color: #58BC82; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
          {% else %}
            <p style="color: white; background-color: #bc5858; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
          {% endif %}
    ;;
  }

  dimension: occurrence {
    type: string
    sql: ${TABLE}.Occurrence ;;
  }


  dimension: park_name {
    hidden: yes
    type: string
    sql: ${TABLE}.Park_Name ;;
    link: {
      label: "View park profile"
      url: "https://productday.dev.looker.com/dashboards/221?Park={{ value | url_encode }}"
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

  measure: count_mammals {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Mammal"
    }
  }

  measure: count_birds {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Bird"
    }
  }

  measure: count_plants {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Vascular Plant"
    }
  }

  measure: count_fish {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Fish"
    }
  }

  measure: count_amphibian {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Amphibian"
    }
  }

  measure: count_insect {
    group_label: "Numbers by Category"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Insect"
    }
  }

  measure: native_population {
    type: count
    filters: {
      field: species.nativeness
      value: "Native"
    }
  }

  measure: percent_native {
    drill_fields: [species_drill*]
    type: number
    sql: ${native_population} / ${count_species} ;;
    value_format_name: percent_2
  }

  set:  species_drill {
    fields: [
      common_names,
      scientific_name,
      is_native,
      conservation_status
    ]
  }

}
