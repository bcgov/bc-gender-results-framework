tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="economic_nt.png", height = "50px"),
                 "Economic Participation and Prosperity")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Equal and full participation in the economy.  
  [Every person should have the opportunity to reach their full potential while
  contributing to, and benefitting from, a strong growing economy. Furthermore, 
  advancing women's economic participation drives economic growth, while boosting 
  the income of Canadian families. Increased income leads to economic independence, 
  which means greater financial security of individuals and their families, 
  helping people exercise control over their lives.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Indicators"),
  
  ### Indicator 2.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Increased labour market opportunities for women, especially women in underrepresented groups",
                      
                      #### Indicator 2.1.1 ----
                      "2.1.1 ", 
                      tags$a("Labour force participation rate", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410032702"),
                      tags$ul(
                        tags$li("The participation rate is the number of labour force participants expressed as a percentage of the population 15 years of age and over."), 
                        tags$li("The participation rate for females in BC is 59.4% compared to 68.0% for males. In Canada the participation rate is 59.6% for females and 68.7% for males."), 
                        ),
                      "2.1.1 Other Relevant BC Data: ",
                      tags$a("BC Economic Recovery Indicators", href = "https://bcstats.shinyapps.io/Economic-Indicators/"),
                      " - Participation Rate (Chart)",
                      br(),br(),
                      
                      #### Indicator 2.1.2 ----
                      "2.1.2 ", 
                      tags$a("Employment rate", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410032702"),
                      tags$ul(
                        tags$li("The employment rate is the number of persons employed expressed as a percentage of the population 15 years of age and over."), 
                        tags$li("The employment rate for females in BC is 54.1% compared to 61.9% for males. In Canada the employment rate is 53.9% for females and 62.1% for males.") 
                      ),
                      "2.1.2 Other Relevant BC Data: ",
                      tags$a("BC Economic Recovery Indicators", href = "https://bcstats.shinyapps.io/Economic-Indicators/"), 
                      " - Employment by Sex (Chart), Unemployment Rate (Chart), Employment Insurance Beneficiaries by Sex (Chart)",
                      br(),br(),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("econ_2_1_1", width = "100%"))
                      ),
  
  ### Indicator 2.2 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Reduced gender wage gap",
                      
                      #### Indicator 2.2.1 ----
                      "2.2.1 ", 
                      tags$a("Gender gap in median hourly wages", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034002&pickMembers%5b0%5d=1.11&pickMembers%5b1%5d=3.1&pickMembers%5b2%5d=5.3&pickMembers%5b3%5d=6.1&cubeTimeFrame.startYear=2016&cubeTimeFrame.endYear=2020&referencePeriods=20160101%2c20200101"), 
                      tags$ul(
                        tags$li("In 2020, the median hourly wage for females 15 years and over was $24.23, compared to the median wage for males of $29.49."), 
                        tags$li("Occupations in educations, law and social, community and goverment services saw the highest gender (median) wage gap in 2020 with a difference of $10.60."), 
                        tags$li("Historically, occupations in the natural resource sector had the highest wage gaps, however the gap dramatically decreased from 2019 ($9.24) to 2020 ($4.97)"),
                        tags$li("Health occupations and sales and service occupations have the smallest wage gap.")
                      ),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("econ_2_2_1", width = "1000px", height = "800px")),
                      
                      #### Indicator 2.2.2 ----
                      "2.2.2 ",
                      tags$a("Gender gap in average hourly wages", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410034002&pickMembers%5b0%5d=1.11&pickMembers%5b1%5d=3.1&pickMembers%5b2%5d=5.3&pickMembers%5b3%5d=6.1&cubeTimeFrame.startYear=2016&cubeTimeFrame.endYear=2020&referencePeriods=20160101%2c20200101"),
                      tags$ul(
                        tags$li("In 2020, the average hourly wage for females 15 years and over was $27.49, compared to the average wage for males of $31.99."), 
                        tags$li("Similar to difference in median wages, occupations in educations, law and social, community and goverment services saw the highest gender (average) wage gap in 2020 with a difference of $7.32."), 
                        tags$li("Health occupations and sales and service occupations have the smallest avearge wage gap as well.")
                      ),
                      "2.2.2 Other Relevant BC Data: ",
                      tags$a("BC Economic Recovery Indicators", href = "https://bcstats.shinyapps.io/Economic-Indicators/"),
                      " - Average Hourly Wage Earnings (Chart)",
                      br(),br(),
                                
                      #### Indicator 2.2.3 ----
                      "2.2.3 ", 
                      tags$a("Gender gap in median annual employment income", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410032401&pickMembers%5b0%5d=1.13&cubeTimeFrame.startYear=2015&cubeTimeFrame.endYear=2019&referencePeriods=20150101%2c20190101"),
                      br(),br(),
                      
                      #### Indicator 2.2.4 ----
                      "2.2.4 ",
                      tags$a("Gender gap in average annual employment income", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410032401&pickMembers%5b0%5d=1.13&cubeTimeFrame.startYear=2015&cubeTimeFrame.endYear=2019&referencePeriods=20150101%2c20190101"),
                      br(), br()
                      ),
  
  ### Indicator 2.3 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title ="Increased full-time employment of women",
                      
                      #### Indicator 2.3.1 ----
                      "2.3.1 ",
                      tags$a("Proportion of workers in full-time jobs", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410032703"),
                      tags$ul(
                        tags$li("The proportion of persons employed full/part-time is the number of persons employed in full/part-time jobs expressed as a proportion of total employment."), 
                        tags$li("71.4% of employed females are employed full-time compared to 85.8% of males. In Canada, the same is true for 75.6% of employed females and 87.7% of employed males."), 
                       ),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("econ_2_3_1", width = "100%"))
                      ),
  
  ### Indicator 2.4 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Equal sharing of parenting roles and family responsibilities",
                      
                      #### Indicator 2.4.1 ----
                      "2.4.1 ",
                      tags$a("Proportion of time spent on unpaid domestic and care work", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=4510001402"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("econ_2_4_1", width = "100%")),
                      
                      #### Indicator 2.4.2 ----
                      "2.4.2 ",
                      tags$a("Number of children in regulated child care spaces and/or early learning programs and/or benefitting from subsidies", href = "https://childcarecanada.org/sites/default/files/ECEC2016-KeyFindings-EN.pdf"),
                      " [Only Canada Data]",
                      br(),br(),
                      "2.4.2 Other Relevant BC Data: ",
                      tags$a("Ministry of Children and Family Development Reporting Portal", href= "https://mcfd.gov.bc.ca/reporting/services"),
                      " (Data and trends for six service lines) - ",
                      tags$a("Early Years Case Data and Trends", href = "https://mcfd.gov.bc.ca/reporting/services/early-years/case-data-and-trends"),
                      br(),br(),
                      
                      #### Indicator 2.4.3 ----
                      "2.4.3 ",
                      tags$a("Proportion of annual household income spent on child care, by economic family type", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1110008001"),
                      "[Only Canada Data]",   
                      br(),br(),
                      "2.4.3 Other Relevant BC Data: ",
                      tags$a("Ministry of Children and Family Development Reporting Portal", href = "https://mcfd.gov.bc.ca/reporting/services"),
                      " (Data and trends for six service lines) - ",
                      tags$a("Early Years Case Data and Trends", href = "https://mcfd.gov.bc.ca/reporting/services/early-years/case-data-and-trends"),
                      br(),br()
                      ),
  
  ### Indicator 2.5 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Better gender balance across occupations",
                      
                      #### Indicator 2.5.1 ----
                      "2.5.1 ", 
                      tags$a("Proportion of occupational group who are women", href = "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410033502"),
                      tags$div(style = "margin-left:20px; margin-bottom:20px",
                               plotOutput("econ_2_5_1", width = "100%")),
                      "2.5.1 Other Relevant BC Data: ",
                      tags$a("Workforce Profiles Report", href = "https://securesurveys.gov.bc.ca/ERAP/workforce-profiles/#/?Des_Grp=IND&Des_Grp=DIS&Des_Grp=VM&Des_Grp=WOM&Employee_Type=ALL&Ministry_Key=BCPS&Year=2020"),
                      " (Statistics on the representation of designated equity groups across the BC Public Service (BCPS) workforce, 
                          including representation of Women, Indigenous Peoples, Persons with Disabilities and members of Visible Minorities)",
                      br(),br(),
                      "2.5.1 Other Relevant BC Data: ",
                      tags$a("BC Public Service 2019 Diversity and Inclusion Survey Results", href = ""),
                      " (Online survey to measure employee experiences and perceptions about diversity and
                         inclusion in the workplace and to provide a baseline understanding about employee
                         experiences in the BC Public Service)",
                      br(),br()
                      ),
  
  ### Indicator 2.6 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "More women in higher-quality jobs, such as permanent and well-paid jobs",
                      
                      #### Indicator 2.6.1 ----
                      "2.6.1 Proportion of persons employed in temporary, involuntary part-time, or low-wage jobs [TBD]",
                      br(),br()
                      )
  
  )



























