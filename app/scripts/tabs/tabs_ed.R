tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="education_nt.png", height = "50px"),
                 "Education and skills development")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Equal opportunities and diversified paths in education and skills development.
   [Every person should have the opportunity to make choices about their education
   based on their interests, aptitudes and economic goals, regardless of gender. 
   In addition, the knowledge-based economy demands a skilled, adaptable and 
   diversified workforce to support Canada's competitiveness and prosperity.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Indicators"),
  ### Indicator 1.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "More diversified educational paths and career choices",
                      
                      #### Indicator 1.1.1 ----
                      "1.1.1 ", 
                      tags$a("Proportion of post-secondary qualification holders who are women, by field of study and qualification type", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710017101&pickMembers%5b0%5d=1.11&pickMembers%5b1%5d=3.4&pickMembers%5b2%5d=2.1", target = "_blank"),
                      br(),
                      tags$ul(
                        tags$li("In B.C., the proportion of females for those aged 25 to 64 years holding a post-secondary certificate, diploma or degree is 52.9% compared to 47.1% of males. In Canada, the same is true for 52.5% of females and 47.5% for males."), 
                        tags$li("For STEM related groupings (science, technology, engineering and mathematics and computer sciences), in B.C., the proportion of females for those aged 25 to 64 years holding a post-secondary certificate, diploma or degree is 31.1% compared to 68.9% of males. In Canada, the same is true for 29.8% of females and 70.2% for males."), 
                        tags$li("For BHASE related groupings (business, humanities, health, arts, social science and education; non-STEM), in B.C., the proportion of females for those aged 25 to 64 years holding a post-secondary certificate, diploma or degree is 57.6% compared to 42.4% of males. In Canada, the same is true for 57.7% of females and 42.3% for males.")
                      ),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("ed_1_1_1", width = "500px")),
                      
                      #### Indicator 1.1.2 ----
                      "1.1.2 ", tags$a("Proportion of post-secondary students who are women, by field of study and credential type", href= "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710016302&pickMembers%5b0%5d=1.11&pickMembers%5b1%5d=2.1&pickMembers%5b2%5d=3.1&pickMembers%5b3%5d=5.1&pickMembers%5b4%5d=6.1&cubeTimeFrame.startYear=2018+/+2019&cubeTimeFrame.endYear=2018+/+2019&referencePeriods=20180101%2c20180101"),
                      br(),
                      tags$ul(
                        tags$li("In B.C., of students enrolled in post-secondary, 55.8% are females and 44.2% are males. In Canada, the same is true for 56.1% of females and 43.9% for males."),
                        tags$li("For STEM related groupings (science, technology, engineering and mathematics and computer sciences), in B.C., of students enrolled in post-secondary, 40.1% are females and 59.9% are males. In Canada, the same is true for 38.3% of females and 61.7% for males."),
                        tags$li("For BHASE related groupings (business, humanities, health, arts, social science and education; non-STEM), in B.C., of students enrolled in post-secondary, 59.9% are females and 40.1% are males. In Canada, the same is true for 61.9% of females and 38.1% for males.")
                      ),
                      "1.1.2 Other Relevant BC Data: ",
                       tags$a("Post-Secondary Data", target = "_blank", href = "https://www2.gov.bc.ca/gov/content/education-training/post-secondary-education/data-research"),
                       " (Data collected from past and present BC post-secondary students) - ",
                       tags$a("Post-Secondary Central Data Warehouse (Gender Report)", target = "_blank", href = "https://www2.gov.bc.ca/assets/gov/education/post-secondary-education/data-research/standard_reports_gender_totals.pdf"),
                       br(), br(),
                                
                      #### Indicator 1.1.3 ----
                      "1.1.3 ", tags$a("High school completion rate", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3710017001&selectedNodeIds=1D11%2c2D4&checkedLevels=0D1%2c2D1%2c2D2%2c3D1%2c3D2%2c3D3%2c3D4%2c4D1&refPeriods=20160101%2c20160101&dimensionLayouts=layout2%2clayout2%2clayout2%2clayout3%2clayout3%2clayout2&vectorDisplay=false"),
                      br(),
                      tags$ul(
                        tags$li("In B.C., the high school completion rate is 90.0% for females aged 25 to 64 years compared to 86.2% for males. In Canada, the same is true for 88.4% of females and 84.1% for males."),
                        tags$li("For those with Indigenous identity, in B.C., the high school completion rate is 75.2% for females aged 25 to 64 years compared to 65.7% for males. In Canada, the same is true for 73.2% of females and 63.9% for males.")
                      ),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("ed_1_1_3", width = "500px"))
                      ),
  
  ### Indicator 1.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Reduced gender gaps in reading and numeracy skills among youth, including Indigenous youth",
                      
                      #### Indicator 1.2.1 ----
                      "1.2.1 ", tags$a("High school reading and mathematics test scores", target = "_blank", href = "https://data.oecd.org/pisa/mathematics-performance-pisa.htm"), " [Only Canada Data]",
                      br(),
                      "1.2.1 Other Relevant BC Data: ",
                      tags$a("Reporting on Student Success", target = "_blank", href = "https://studentsuccess.gov.bc.ca/"),
                      "(Data from the BC school system) - ",
                      tags$a("Foundation Skills Assessment, Graduation Assessments", target = "_blank", href = "https://studentsuccess.gov.bc.ca/school-district/099/report/fsa"),
                      ),
  
  ## Indicator 1.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="Equal lifelong learning opportunities and outcomes for adults",
                      
                      #### Indicator 1.3.1 ----
                      "1.3.1 ", tags$a("Adults' literacy and numeracy test scores", target = "_blank", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3710004701&selectedNodeIds=1D11%2c5D2%2c5D3&checkedLevels=0D1%2c1D2%2c2D1%2c2D2%2c3D1&refPeriods=20120101%2c20120101&dimensionLayouts=layout2%2clayout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),
                      tags$ul(
                        tags$li("In B.C., for literacy, the percent of the population aged 16 to 65 years scoring at proficiency level 3 or above is 52.5% for females and 55.8% for males. In Canada, the same is true for 50.6% of females and 52.4% for males."),
                        tags$li("In B.C., for numeracy, the percent of the population aged 16 to 65 years scoring at proficiency level 3 or above is 42.3% for females and 53.0% for males. In Canada, the same is true for 39.6% of females and 51.0% for males."),          
                        )
                      ,
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("ed_1_3_1", width = "500px"))
                      )
  )