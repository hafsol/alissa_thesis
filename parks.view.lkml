view: parks {
  sql_table_name: biodiversity_in_parks.parks ;;

  dimension: park_code {
    map_layer_name: natparks
    primary_key: yes
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: park_name {
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: park_acres {
    group_label: "Geography"
    description: "Size of the national park in acres"
    type: number
    sql: ${TABLE}.Park_Acres ;;
  }

  dimension: state {
    description: "The US state in which a park is located"
    drill_fields: [drill_state*]
    group_label: "Geography"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: park_location {
    description: "The location of a park in terms of latitude and longitude"
    group_label: "Geography"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: region {
    description: "The region in which the park is located, as defined by the NPS"
    group_label: "Geography"
    case: {
      when: {
        sql: ${parks.state} in ('CA', 'OR', 'WA', 'ID', 'NV', 'HI', 'AS', 'GU' ) ;;
        label: "Pacific West"
      }
      when: {
        sql: ${parks.state} in ('MT', 'WY', 'UT', 'AZ', 'CO', 'NM', 'TX', 'OK') ;;
        label: "Intermountain"
      }
      when: {
        sql: ${parks.state} in ('ND', 'SD', 'NE', 'KS', 'MN', 'IA', 'MO', 'AR', 'WI', 'MI', 'IL', 'IN', 'OH') ;;
        label: "Midwest"
      }
      when: {
        sql: ${parks.state} in ('ME', 'NH', 'VT', 'NY', 'MA', 'CT', 'RI', 'PA', 'NJ', 'DE', 'MD', 'VA', 'WV') ;;
        label: "Northeast"
      }
      when: {
        sql: ${parks.state} in ('KY', 'TN', 'LA', 'MS', 'AL', 'GA', 'FL', 'SC', 'NC', 'VI', 'PR') ;;
        label: "Southeast"
      }
      when: {
        sql: ${parks.state} = 'AK' ;;
        label: "Alaska"
      }
      when: {
        sql: ${parks.state} = 'DC' ;;
        label: "National Capitol"
      }
      else: "Multiple States"
    }
  }

  dimension: park_code_images {
    type: string
    sql: ${TABLE}.Park_Code ;;
    html: {% if value == "ACAD" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/ner/homepage/7381B1C9-E53F-0592-5EE2CA8D0866AA2E.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "ARCH" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/83ED3EB5-1DD8-B71B-0BE31C0A54E289E2.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "BADL" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/491D568A-1DD8-B71B-0B8DC6D83B0CDA51.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "BIBE" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/F69740AB-1DD8-B71B-0BF4CCD783D01EDD.JPG" style="width:1500px;height:500px;" />
          {% elsif value == "BISC" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/C7A242B8-E5FB-95AE-8EE9B600B1444CD6.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "BLCA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/0B6DFCE9-1DD8-B71B-0B379BA8D30DC0D6.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "BRCA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/902D3822-1DD8-B71B-0B45B33613561C70.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CANY" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/B5648379-BBF3-D260-90EFFB135CE4EC56.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CARE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/27E22C89-1DD8-B71B-0B1D8E1F50037612.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CAVE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/0FEB89D9-1DD8-B71B-0BC5A6AAF1C1984C.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CHIS" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/8B1831DF-1DD8-B71B-0BF9865C590EE5A5.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CONG" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/C632FF77-1DD8-B71B-0B63EA949BD9BBD0.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CRLA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/6B97B34B-1DD8-B71B-0B609E4FF8532FE9.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "CUVA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/DC4FE2F1-E41E-483E-EA2B62FE12926558.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "DENA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/ECE79510-155D-9421-1FCF6F833BD84413.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "DEVA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/D0D65293-1DD8-B71B-0B90C84869AED282.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "DRTO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/B8CF5C7E-1DD8-B71B-0B62F152705DCACA.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "EVER" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/510DA558-1DD8-B71B-0BF2DBBE49B06F9F.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GAAR" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/80BF2CBB-1DD8-B71B-0B0EE177F0BF9659.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GLAC" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/7713009E-E39E-5A97-24C5D24540F58555.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GLBA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/CE2C26AD-1DD8-B71B-0B72E264E74BDAE6.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GRBA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/6335B973-1DD8-B71B-0BA4AA7F19E16904.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GRCA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GRSA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/0805F9FA-1DD8-B71B-0BD0B5F4D6BDCE8F.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GRSM" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/3FF6F0E2-BCB9-2C92-3D4AC60512137D8A.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GRTE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/80DDA74C-1DD8-B71B-0B7F0D6464FA6E5E.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "GUMO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/127F00C2-1DD8-B71B-0BBF78268AF69C99.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "HALE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/357AE736-1DD8-B71B-0B099C77F75FF816.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "HAVO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/D9667D5A-0F06-FF3A-763702075902EB0F.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "HOSP" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/3FA77A7E-1DD8-B71B-0B6388E53AF5DC8C.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "ISRO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/49808CFA-1DD8-B71B-0B91977756F417E8.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "JOTR" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/F836E601-1DD8-B71B-0BC2936CDBC2FC26.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "KATM" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/69100A9A-1DD8-B71B-0B035340E022A665.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "KEFJ" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/C6958F15-1DD8-B71B-0B4F85BE63854422.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "KOVA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/9387BAE7-1DD8-B71B-0B99E9438363CFE6.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "LACL" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/BBED63A4-03CA-BC01-CC5CC44E2B9B26A5.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "LAVO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/FBD3F8FA-1DD8-B71B-0B12C9B31279B4E7.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "MACA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/980CB50C-1DD8-B71B-0B4F8385CDB02DF2.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "MEVE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/D74A4198-1DD8-B71B-0BD9665B20051D86.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "MORA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/EFEE6DC6-1DD8-B71B-0B9A2188BE6539A9.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "NOCA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/575C3B44-1DD8-B71B-0BD879DB3BC0AD69.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "OLYM" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/344389AF-1DD8-B71B-0BC1B4DA476CD781.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "PEFO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/2B94F964-1DD8-B71B-0B131B9817A05636.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "PINN" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/2913AF89-1DD8-B71B-0B428CC0594DA1F3.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "REDW" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/pwr/secondary/E7886391-B283-E7E6-3AB2428BB1035429.jpg" style="width:1500px;height:400px;" />
          {% elsif value == "ROMO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/4A4314B5-1DD8-B71B-0B54368EB2003033.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "SAGU" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/5D2733EE-1DD8-B71B-0B24869B10725BC0.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "SEKI" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/E1511E88-1DD8-B71B-0BD8E4869528C181.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "SHEN" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/ner/homepage/EC803A56-1DD8-B71B-0BD7EE282E4EAECD.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "THRO" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/2118F52C-1DD8-B71B-0B0713EA8F3E1AEA.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "VOYA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/A2B896D3-1DD8-B71B-0B5121682556E710.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "WICA" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/mwr/homepage/CC25AAB0-1DD8-B71B-0B48DF48A0B8DE84.JPG" style="width:1500px;height:500px;" />
          {% elsif value == "WRST" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/akr/homepage/F8805363-1DD8-B71B-0BE59C3D3428BD7B.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "YELL" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/DE9343A8-AE1F-6F61-EC73DF4FD61F820B.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "YOSE" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/36C683FE-1DD8-B71B-0B6B4AE9C34946B8.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "ZION" %}
           <img src="https://www.nps.gov/common/uploads/banner_image/imr/homepage/0047D4F0-1DD8-B71B-0B56566586F793FA.jpg" style="width:1500px;height:500px;" />
          {% else %}
            {{value}}
          {% endif %}
    ;;
  }

  # images showing animals

  # define dimension has_grizzly_bears yesno

  # define dimension has_mountain_lions yesno

  # define largest_parks

  # define smallest_parks

  measure: count {
    type: count
  }

  measure: park_count {
    label: "Number of Parks"
    type: count_distinct
    sql: ${park_code} ;;
  }


  measure: total_acres {
    label: "Acreage of the park"
    type: sum
    sql: ${park_acres} ;;
  }


  set: drill_state {
    fields: [
      park_name,
      park_acres,
      park_code_images,
      species.count
    ]
  }

}
