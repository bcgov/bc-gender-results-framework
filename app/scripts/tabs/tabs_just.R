tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="justice_nt.png", height = "50px"),
                 "Gender-Based Violence and Access to Justice")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Eliminating gender-based violence and harassment, and promoting security of 
  the person and access to justice.  [Gender-based violence (GBV) is a preventable 
  and significant barrier to gender equality. While anyone can be a victim of 
  violence, women and girls, as well as members of the LGBTQ2 community and non-binary 
  people, face a greater risk of sexual assault, intimate partner violence, and 
  human trafficking. Violence can have impacts on a person's physical, mental, sexual 
  and reproductive health, which can span generations. Discrimination, harassment 
  and sexual violence in the workplace can also have profound negative effects on 
  health and safety, absenteeism and decreasing productivity. Access to and confidence
  in the criminal justice system is foundational to Canadian society.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Indicators"),
  
  ### Indicator 4.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Workplaces are harassment-free",
                      
                      #### Indicator 4.1.1 ----
                      "4.1.1 ", tags$a("Proportion of employees who self-report being harassed in the workplace", href = "https://www150.statcan.gc.ca/n1/daily-quotidien/181217/dq181217b-eng.htm"),
                      "[Only Canada Data]",
                      br(),br()
                      ),
  
  ### Indicator 4.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Fewer women are victims of intimate partner violence and sexual assault",
                      
                      #### Indicator 4.2.1 ----
                      "4.2.1 Proportion of women and girls aged 15 years and older subjected to physical, sexual or psychological violence by a current or former intimate partner [TBD]",
                      br(),br(),
                      
                      #### Indicator 4.2.2 ----
                      "4.2.2 ", 
                      tags$a("Proportion of population who self-reported being sexually assaulted, since age 15", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3510016601&selectedNodeIds=1D11%2c4D1%2c4D2&checkedLevels=0D1%2c1D1%2c1D2%2c1D3%2c2D2&refPeriods=20180101%2c20180101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),br()
                      ),
  
  ### Indicator 4.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="Fewer victims of childhood maltreatment",
                      
                      #### Indicator 4.3.1 ----
                      "4.3.1 ", 
                      tags$a("Proportion of population who self-reported childhood maltreatment (before age 15), by type of maltreatment", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3510016701&selectedNodeIds=1D11%2c5D1%2c5D2&checkedLevels=0D1%2c1D1%2c2D1%2c2D2%2c2D3%2c3D2&refPeriods=20180101%2c20180101&dimensionLayouts=layout2%2clayout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),br(),
                      "4.3.1 Other Relevant BC Data: ",
                      tags$a("Ministry of Children and Family Development Reporting Portal", href = "https://mcfd.gov.bc.ca/reporting/services"),
                      " (Data and trends for six service lines) - ",
                      tags$a("Child Protection Services - Four Key Stages, Child Protection Reports Case Data and Trends, Permanency for Children & Youth in Care Case Data and Trends", href = "https://mcfd.gov.bc.ca/reporting/services/child-protection/permanency-for-children-and-youth/case-data-and-trends"),
                      br(),br()
                      ),
  
  ### Indicator 4.4 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Fewer women killed by an intimate partner",
                      
                      #### Indicator 4.4.1 ----
                      "4.4.1 Homicide rate, by relationship to the perpetrator [TBD]",
                      br(),br()
                      ),
  
  ### Indicator 4.5 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased police reporting of violent crimes",
                      
                      #### Indicator 4.5.1 ----
                      "4.5.1 ", tags$a("Proportion of self-reported incidents of violent crime reported to police, past 12 months, by type of crime", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3510012001"),
                      "[", tags$a("Additional Canada Data", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3510012001"),"]",
                      br(),br()
                      ),
  
  ### Indicator 4.6 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Fewer Indigenous women and girls are victims of violence",
                      
                      #### Indicator 4.6.1 ----
                      "4.6.1 ", 
                      tags$a("Proportion of Indigenous women and girls subjected to physical, sexual or psychological violence, by Indigenous identity", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=3510016801&selectedNodeIds=1D11%2c5D1%2c5D2&checkedLevels=0D1%2c1D1%2c2D1%2c2D2%2c2D3%2c3D2&refPeriods=20180101%2c20180101&dimensionLayouts=layout2%2clayout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),br()
                      ),
  
  
  ### Indicator 4.7 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased accountability and responsiveness of the Canadian criminal justice system",
                      
                      #### Indicator 4.7.1 ----
                      '4.7.1 Proportion of sexual assaults reported to police that are deemed "unfounded" [TBD]',
                      br(),br()
                      )
  
  )


























