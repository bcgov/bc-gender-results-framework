tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="leadership_nt.png", height = "50px"),
                 "Leadership and Democratic Participation")),
  
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
  h3(style = "color:#00008b", "Indicators"),
  
  ### Indicator 3.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "More women in senior management positions, and more diversity in senior leadership positions",
                      
                      #### Indicator 3.1.1 ----
                      "3.1.1 ", 
                      tags$a("Proportion of employees in management positions who are women, by management level", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410033503"),
                      br(),br(),
                      ),
  
  ### Indicator 3.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased opportunities for women to start and grow their businesses, and succeed on a global scale",
                      
                      #### Indicator 3.2.1 ----
                      "3.2.1 ", 
                      tags$a("Proportion of businesses majority-owned by women, by business size", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3310019101"),
                      "[", tags$a("Additional Canada Data (By Age)", href="https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3310019201"), "]",
                      br(),br(),
                      "3.2.1 Other Relevant BC Data: ",
                      tags$a("Small Business Statistics", href="https://www2.gov.bc.ca/gov/content/data/statistics/business-industry-trade/small-business"),
                      " (Data and analysis related to small businesses in BC) - ",
                      tags$a("BC Small Business Profile 2020", href = "https://www2.gov.bc.ca/assets/gov/employment-business-and-economic-development/business-management/small-business/sb_profile.pdf"),
                      br(),br()
                      ),
  
  ### Indicator 3.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="More company board seats held by women, and more diversity on company boards",
                      
                      #### Indicator 3.3.1 ----
                      "3.3.1 ", 
                      tags$a("Proportion of board members who are women, by type of board", href = ""),
                      "[Only Canada Data]",
                      br(),br()
                      ),
  
  ### Indicator 3.4 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Equal sharing of parenting roles and family responsibilities",
                      
                      #### Indicator 3.4.1 ----
                      "3.4.1 ", 
                      tags$a("Proportion of seats held by women in national Parliament", href = "https://www150.statcan.gc.ca/t1/tbl1/en/cv%21recreate.action?pid=1010013701&selectedNodeIds=1D11%2c2D29%2c2D30%2c2D32%2c2D53%2c2D54%2c2D55&checkedLevels=0D1%2c2D1%2c2D2%2c3D1&refPeriods=20200101%2c20200101&dimensionLayouts=layout2%2clayout3%2clayout2%2clayout2%2clayout2&vectorDisplay=false"),
                      br(),br(),
                      
                      #### Indicator 3.4.2 ----
                      "3.4.2 ", 
                      tags$a("Proportion of seats held by women in local governments (provincial, territorial, municipal, First Nations Band Councils)", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=4110004801"),
                      "[Only Canada Data (For First Nations Band Councils Only)]",
                      br(),br(),
                      "3.4.2 Other Relevant BC Data: ",
                      tags$a("Elections BC", href = "https://elections.bc.ca/resources/results/provincial-election-results/"),
                      " (Provincial election results) - ",
                      tags$a("Provincial Voting Results by Candidate", href = "https://elections.bc.ca/docs/GE-2020-10-24_Candidate.html"),
                      br(),br(),
                      "3.4.2 Other Relevant BC Data: ",
                      tags$a("CivicInfo BC", href = "https://www.civicinfo.bc.ca/election"),
                      " (Central repository for local election information in BC for 
                                   Municipalities, Regional Districts, Islands Trust, Park Boards, School Districts) - ",
                      tags$a("2018 Candidates and Results", href = "https://www.civicinfo.bc.ca/electionreports/candidates-and-results.php?year=2018"),
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
                      title = "Better gender balance across occupations",
                      
                      #### Indicator 3.5.1 ----
                      "3.5.1 ",
                      tags$a("Proportion of federally appointed judges (federal and provincial courts) who are women", href = "https://www.fja.gc.ca/appointments-nominations/judges-juges-eng.aspx"),
                      br(),br(),
                      
                      #### Indicator 3.5.2 ----
                      "3.5.2 Proportion of law enforcement, security and intelligence officers who are women, by rank [TBD]",
                      br(),br()
                      ),
  
  )


























