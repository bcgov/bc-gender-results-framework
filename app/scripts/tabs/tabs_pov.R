# Copyright 2019 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="poverty_nt.png", height = "50px"),
                 "Poverty reduction, health and well-Being")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Reduced poverty and improved health outcomes.
  [Poverty is a challenge faced by men and women alike, but its effects can be 
  different for women and girls, who are more likely to be victims of violence, 
  to live alone and to be affected by chronic conditions and disabilities at older
  ages. Ensuring all members of our society have a real and fair chance at success
  is part of the Government's plan to strengthen and grow the middle class.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Objectives & Indicators"),
  
  ### Indicator 5.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Fewer vulnerable individuals living in poverty",
                      
                      #### Indicator 5.1.1 ----
                      "5.1.1 ", 
                      tags$a("Prevalence of low income, by economic family type", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=1110013601&selectedNodeIds=1D13%2c3D6%2c4D2&checkedLevels=0D1%2c1D1%2c1D2%2c1D3&refPeriods=20180101%2c20190101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      "[", 
                      tags$a("Additional Canada Data", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=1110013601&selectedNodeIds=1D13%2c3D6%2c4D2&checkedLevels=0D1%2c1D1%2c1D2%2c1D3&refPeriods=20180101%2c20190101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      "]",
                      br(),br()
                      ),
  
  ### Indicator 5.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Fewer women and children living in food-insecure households",
                      
                      #### Indicator 5.2.1 ----
                      "5.2.1 ", 
                      tags$a("Proportion of individuals living in households that are moderately or severely food-insecure, by economic family type", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=1310038501&selectedNodeIds=1D11%2c3D1%2c3D5%2c4D4&checkedLevels=0D1%2c1D1%2c1D2%2c2D2&refPeriods=20170101%2c20170101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("pov_5_2_1", width = "100%"))
                      ),
  
  ### Indicator 5.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="Fewer vulnerable individuals lacking stable, safe and permanent housing",
                      
                      #### Indicator 5.3.1 ----
                      "5.3.1 ", 
                      tags$a("Proportion of the population in core housing need, by economic family type", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3910005001&selectedNodeIds=1D13%2c2D6&checkedLevels=0D1%2c2D1%2c3D1%2c3D2%2c4D1%2c4D2%2c4D3%2c4D4&refPeriods=20060101%2c20160101&dimensionLayouts=layout2%2clayout2%2clayout2%2clayout2%2clayout3%2clayout2&vectorDisplay=false"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("pov_5_3_1", width = "100%")),
                      "5.3.1 Other Relevant B.C. Data: ",
                      tags$a("BC Housing Research Centre", target = "_blank", href = "https://www.bchousing.org/research-centre"),
                      " (Includes ", tags$a("Housing Data", target = "_blank", href = "https://www.bchousing.org/research-centre/housing-data"),
                      tags$a("Research Themes,", target = "_blank", href = "https://www.bchousing.org/research-centre/research-themes"),
                      tags$a("Facts & Stats", target = "_blank", href = "https://www.bchousing.org/research-centre/facts-stats"),
                      "and a ", 
                      tags$a("Research Library", target = "_blank", href = "https://www.bchousing.org/research-centre/library"), " - ",
                      tags$a("Homeless Counts", target = "_blank", href = "https://www.bchousing.org/research-centre/housing-data/homeless-counts"),
                      br(),br(),
                      "5.3.1 Other Relevant B.C. Data: ",
                      tags$a("Housing Experiences in Canada", target = "_blank", href= " https://www150.statcan.gc.ca/n1/pub/46-28-0001/462800012021001-eng.htm"),
                      "(Includes fact sheets from Statistics Canada for total population and households, age and gender groups, immigrants, visible minorities, Indigenous populations and other groups based on the 2018 Canadian Housing Survey and 2016 Census of Population)",
                      br(),br()
                      ),
  
  ### Indicator 5.4 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Child and spousal support orders enforced",
                      
                      #### Indicator 5.4.1 ----
                      "5.4.1 ",
                      tags$a("Collection rate, by type of beneficiary", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3510012101"),
                      "[Only Canada Data]",
                      br(),br()
                      ),
  
  ### Indicator 5.5 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "More years in good health",
                      
                      #### Indicator 5.5.1 ----
                      "5.5.1 ", 
                      tags$a("Leading causes of death", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310080002"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("pov_5_5_1", width = "100%")),
                      
                      #### Indicator 5.5.2 ----
                      "5.5.2 ",
                      tags$a("Health-adjusted life expectancy at birth", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310037001"),
                      br(),br(),
                      
                      #### Indicator 5.5.3 ----
                      "5.5.3 ", 
                      tags$a("Proportion of population that participated regularly in sport", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310060201"),
                      br(),br()
                      ),
  
  ### Indicator 5.6 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Improved mental health",
                      
                      #### Indicator 5.6.1 ----
                      "5.6.1 ", 
                      tags$a("Proportion of adults who have high psychological well-being", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310080502"),
                      br(),br(),
                      "5.6.1 Other Relevant B.C. Data: ",
                      tags$a("Ministry of Children and Family Development Reporting Portal", target = "_blank", href = "https://mcfd.gov.bc.ca/reporting/services"),
                      " (Data and trends for six service lines) - ",
                      tags$a("Child and Youth Mental Health Case Data and Trends", target = "_blank", href = "https://mcfd.gov.bc.ca/reporting/services/child-and-youth-mental-health/case-data-and-trends"),
                      br(),br()
                      ),
  
  
  ### Indicator 5.7 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Improved access to contraception for young people and reduced adolescent birth rate",
                      
                      #### Indicator 5.7.1 ----
                      "5.7.1 ", 
                      tags$a("Proportion of population aged 15 to 49 that did not use contraception among sexually active population not trying to conceive", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310038201"),
                      br(),br(),
                      
                      #### Indicator 5.7.2 ----
                      "5.7.2 ", 
                      tags$a("Adolescent birth rate (aged 15 to 19) per 1,000 women in that age group", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310041802"),
                      br(),br()
                      )
  )



























