tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="leadership_nt.png", height = "50px"),
                 "Leadership and democratic participation")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Gender equality in leadership roles and at all levels of decision-making.
  [A more balanced distribution of men and women at all levels of decision-making
  is essential to a fair and democratic society. It also leads to better decision-making.
  Gender equality and diversity in positions of leadership are also associated 
  with better management, increased availability of skilled employees, stronger 
  employee engagement and higher productivity.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Objectives & Indicators"),
  
  ### Indicator 3.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "More women in senior management positions, and more diversity in senior leadership positions",
                      
                      #### Indicator 3.1.1 ----
                      "3.1.1 ", 
                      tags$a("Proportion of employees in management positions who are women, by management level", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410033503"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("lead_3_1_1", width = "100%"))
                      ),
  
  ### Indicator 3.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased opportunities for women to start and grow their businesses, and succeed on a global scale",
                      
                      #### Indicator 3.2.1 ----
                      "3.2.1 ", 
                      tags$a("Proportion of businesses majority-owned by women, by business size", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3310019101"),
                      "[", tags$a("Additional Canada Data (By Age)", target = "_blank", href="https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3310019201"), "]",
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("lead_3_2_1", width = "100%")),
                      "3.2.1 Other Relevant B.C. Data: ",
                      tags$a("Small Business Statistics", target = "_blank", href="https://www2.gov.bc.ca/gov/content/data/statistics/business-industry-trade/small-business"),
                      " (Data and analysis related to small businesses in B.C.) - ",
                      tags$a("B.C. Small Business Profile 2020", target = "_blank", href = "https://www2.gov.bc.ca/assets/gov/employment-business-and-economic-development/business-management/small-business/sb_profile.pdf"),
                      br(),br()
                      ),
  
  ### Indicator 3.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="More company board seats held by women, and more diversity on company boards",
                      
                      #### Indicator 3.3.1 ----
                      "3.3.1 ", 
                      tags$a("Proportion of board members who are women, by type of board", target = "_blank", href = ""),
                      "[Only Canada Data]",
                      br(),br()
                      ),
  
  ### Indicator 3.4 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Greater representation of women and underrepresented groups in elected office and ministerial positions in national and sub-national governments",
                      
                      #### Indicator 3.4.1 ----
                      "3.4.1 ", 
                      tags$a("Proportion of seats held by women in national Parliament", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=1010013701&selectedNodeIds=1D11%2c2D29%2c2D30%2c2D32%2c2D53%2c2D54%2c2D55&checkedLevels=0D1%2c2D1%2c2D2%2c3D1&refPeriods=20200101%2c20200101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),br(),
                      
                      #### Indicator 3.4.2 ----
                      "3.4.2 ", 
                      tags$a("Proportion of seats held by women in local governments (provincial, territorial, municipal, First Nations Band Councils)", target = "_blank", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=4110004801"),
                      "[Only Canada Data (For First Nations Band Councils Only)]",
                      br(),br(),
                      "3.4.2 Other Relevant B.C. Data: ",
                      tags$a("Elections BC", target = "_blank", href = "https://elections.bc.ca/resources/results/provincial-election-results/"),
                      " (Provincial election results) - ",
                      tags$a("Provincial Voting Results by Candidate", target = "_blank", href = "https://elections.bc.ca/docs/GE-2020-10-24_Candidate.html"),
                      br(),br(),
                      "3.4.2 Other Relevant B.C. Data: ",
                      tags$a("CivicInfo BC", target = "_blank", href = "https://www.civicinfo.bc.ca/election"),
                      " (Central repository for local election information in B.C. for 
                                   Municipalities, Regional Districts, Islands Trust, Park Boards, School Districts) - ",
                      tags$a("2018 Candidates and Results", target = "_blank", href = "https://www.civicinfo.bc.ca/electionreports/candidates-and-results.php?year=2018"),
                      br(),br(),
                      
                      #### Indicator 3.4.3 ----
                      "3.4.3 Proportion of ministerial positions held by women in federal-provincial-territorial 
                                   governments and Chiefs in First Nations communities who are women [See Above Data in 3.4.1 and 3.4.2]",
                      br(),br()
                      ),
  
  ### Indicator 3.5 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased representation of women and underrepresented groups as administrators of the justice system",
                      
                      #### Indicator 3.5.1 ----
                      "3.5.1 ",
                      tags$a("Proportion of federally appointed judges (federal and provincial courts) who are women", target = "_blank", href = "https://www.fja.gc.ca/appointments-nominations/judges-juges-eng.aspx"),
                      br(),br(),
                      
                      #### Indicator 3.5.2 ----
                      "3.5.2 Proportion of law enforcement, security and intelligence officers who are women, by rank [TBD]",
                      br(),br()
                      ),
  
  )



























