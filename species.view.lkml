view: species {
  sql_table_name: biodiversity_in_parks.species ;;

  dimension: species_id {
    description: "National Parks Service park code."
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Species_ID ;;
  }

  dimension: abundance {
    group_label: "Species Facts"
    description: "Commonality of sightings."
    type: string
    sql: ${TABLE}.Abundance ;;
  }

  dimension: category {
    group_label: "Species Classification"
    description: "The category a species belongs to, incl. Mammal, Bird, etc."
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
        {% elsif value == "Insect" %}
          <p style="color: white; background-color: #666666; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Amphibian" %}
          <p style="color: black; background-color: #07f78f; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Invertebrate" %}
          <p style="color: white; background-color: #b7312a; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Reptile" %}
          <p style="color: white; background-color: #689900; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% elsif value == "Slug/Snail" %}
          <p style="color: black; background-color: #e8bd25; font-size: 120%; font-weight: bold; text-align:center">{{value}}</p>
        {% else %}
          {{value}}
        {% endif %}
    ;;
  }

  dimension: category_image {
    hidden: yes
    type: string
    sql: ${category} ;;
    html:
        {% if value == "Bird" %}
          <img src="http://icons.iconarchive.com/icons/google/noto-emoji-animals-nature/1024/22271-bird-icon.png" style="width:50px;height:50px;" />
        {% elsif value == "Vascular Plant" %}
          <img src="https://avatanplus.com/files/resources/mid/56ea94de9ffa2153845585bf.png" style="width:75px;height:60px;" />
        {% elsif value == "Mammal" %}
          <img src="http://worldartsme.com/images/black-bear-clipart-1.jpg" style="width:60px;height:60px;" />
        {% elsif value == "Fish" %}
          <img src="https://img.clipartxtras.com/599b9cf1ac083af16ca129f735eaff63_royalty-free-rainbow-trout-clip-art-vector-images-illustrations-trout-fish-clipart_858-1024.jpeg" style="width:50px;height:50px;" />
        {% elsif value == "Reptile" %}
          <img src="https://img.clipartxtras.com/aad75f0c5dbe8bd2b5c01c67dde202f7_sea-turtle-clip-art-free-wikiclipart-turtle-clipart-png_750-388.png" style="width:60px;height:50px;"/>
        {% elsif value == "Nonvascular Plant" %}
          <img src="https://orig00.deviantart.net/4bfe/f/2017/005/3/b/liverwort_by_gryphrealms_arpg-daudeek.png" style="width:60px;height:50px;"/>
        {% elsif value == "Amphibian" %}
          <img src="https://b.kisscc0.com/20180705/ycw/kisscc0-the-tree-frog-amphibian-download-frog-coloured-5b3d99549b1035.3154820915307636046352.png" style="width:50px;height:50px;"/>
        {% elsif value == "Insect" %}
          <img src="https://i.pinimg.com/originals/eb/cb/ac/ebcbacda161594c9e75b47bbf07eac4e.png" style="width:50px;height:50px;"/>
        {% elsif value == "Invertebrate" %}
          <img src="https://melbournechapter.net/images/beetle-clipart-2.png" style="width:55px;height:40px;"/>
        {% elsif value == "Fungi" %}
          <img src="https://mbtskoudsalg.com/images/mushrooms-clipart-1.jpg" style="width:50px;height:50px;"/>
        {% elsif value == "Slug/Snail" %}
          <img src="https://img00.deviantart.net/ec6e/i/2018/269/a/a/california_banana_slug__ariolimax_californicus__by_hyaenija-dch8hom.png" style="width:50px;height:45px;"/>
        {% elsif value == "Crab/Lobster/Shrimp" %}
          <img src="https://melbournechapter.net/images/blue-crab-clipart-8.png" style="width:50px;height:45px;"/>
        {% elsif value == "Algae" %}
          <img src="http://www.gdg.ca/wp-content/uploads/2018/01/AdobeStock_136209349.png" style="width:50px;height:45px;"/>
        {% elsif value == "Spider/Scorpion" %}
          <img src="http://www.clker.com/cliparts/v/I/N/x/l/U/spider-md.png" style="width:45px;height:45px;"/>
        {% else %}
          {{value}}
        {% endif %}
    ;;
  }


  dimension: order {
    group_label: "Species Classification"
    description: "The scientific order the species belongs to."
    type: string
    sql: ${TABLE}.`Order` ;;
  }

  dimension: family {
    group_label: "Species Classification"
    description: "The scientific family the species belongs to."
    type: string
    sql: ${TABLE}.Family ;;
  }

  dimension: scientific_name {
    group_label: "Species Classification"
    description: "Full scientific species name."
    drill_fields: [species_drill*]
    type: string
    sql: ${TABLE}.Scientific_Name ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://www.google.com/s2/favicons?domain=www.google.com" height=15 width=15> </a> ;;

  }

  dimension: common_names {
    group_label: "Species Classification"
    description: "Common name(s) for the species."
    label: "Common Name"
    type: string
    sql: ${TABLE}.Common_Names ;;
    html: <p style="color: black; background-color: #D1BEB0; font-size: 140%; text-align:center">{{value}}</p> ;;
  }


  dimension: conservation_status {
    group_label: "Species Facts"
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
    group_label: "Species Facts"
    description: "Whether the species is native to the area or non-native/invasive."
    type: string
    sql: ${TABLE}.Nativeness ;;
  }

  dimension: is_native {
    hidden: yes
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
    group_label: "Species Facts"
    description: "Whether or not the species presence in the park has been confirmed (one of 'Present', 'Not Confirmed', 'Not Present (Historical)')."
    type: string
    sql: ${TABLE}.Occurrence ;;
  }


  dimension: park_name {
    hidden: yes
    description: "Park in which the species appears."
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
    group_label: "Species Facts"
    description: "Usually 'Approved'."
    type: string
    sql: ${TABLE}.Record_Status ;;
  }

  dimension: seasonality {
    group_label: "Species Facts"
    description: "When the species can be found in the park. Null (blank) if the species is found there year-round."
    type: string
    sql: ${TABLE}.Seasonality ;;
  }



## measures

  measure: count {
    hidden: yes
    type: count
    drill_fields: [species_drill*]
  }

  measure: count_species {
    label: "Number of Species"
    description: "The count of all species."
    type: count
    drill_fields: [species_drill*]
  }

  measure: native_population {
    label: "Number of Native Species"
    group_label: "Number of Species by Status"
    description: "The number of species with native status."
    drill_fields: [species_drill*]
    type: count
    filters: {
      field: species.nativeness
      value: "Native"
    }
  }

  measure: nonnative_population {
    label: "Number of Non-Native Species"
    group_label: "Number of Species by Status"
    description: "The number of species with non-native status."
    drill_fields: [species_drill*]
    type: count
    filters: {
      field: species.nativeness
      value: "Not Native"
    }
  }

  measure: percent_native {
    hidden: yes
    group_label: "Number of Species by Status"
    drill_fields: [species_drill*]
    type: number
    sql: ${native_population} / ${count_species} ;;
    value_format_name: percent_2
  }

  measure: count_species_endangered {
    group_label: "Number of Species by Status"
    label: "Count Endangered/Threatened"
    description: "The number of species with IUCN Endangered, Threatened, Proposed Endangered, or Proposed Threatened status."
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.conservation_status
      value: "Endangered,Threatened,Proposed Endangered,Proposed Threatened"
    }
  }

  measure: count_mammals {
    group_label: "Number of Species per Category"
    label: "Types of Mammal"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Mammal"
    }
  }

  measure: count_birds {
    group_label: "Number of Species per Category"
    label: "Types of Bird"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Bird"
    }
  }

  measure: count_plants {
    group_label: "Number of Species per Category"
    label: "Types of Plant"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Vascular Plant,Nonvascular Plant"
    }
  }

  measure: count_fish {
    group_label: "Number of Species per Category"
    label: "Types of Fish"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Fish"
    }
  }

  measure: count_amphibian {
    group_label: "Number of Species per Category"
    label: "Types of Amphibian"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Amphibian"
    }
  }

  measure: count_insect {
    group_label: "Number of Species per Category"
    label: "Types of Insect"
    type: count
    drill_fields: [species_drill*]
    filters: {
      field: species.category
      value: "Insect"
    }
  }


  set:  species_drill {
    fields: [
      common_names,
      scientific_name,
      family,
      order,
      category,
      is_native,
      conservation_status,
      abundance
    ]
  }

}
