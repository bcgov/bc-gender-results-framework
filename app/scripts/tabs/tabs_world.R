tags$fieldset(
  style = "margin-top:20px;",
  tags$legend(h2(tags$img(src="world_nt.png", height = "50px"),
                 "Gender equality around the world")),
  
  ## Goals ----
  h3(style = "color:#00008b", "Goal"),
  "Promoting gender equality to build a more peaceful, inclusive, rules-based and 
  prosperous world.  [Canada is committed to eliminating poverty, and building a 
  more peaceful, inclusive and prosperous world. The Government will invest in 
  women's empowerment and gender equality as the best ways to achieve these 
  objectives, grounded in the Agenda 2030 for Sustainable Development. Numerous 
  studies tell us this is the right course. It has been estimated that achieving 
  gender equality around the world could increase global GDP by $12 trillion over
  10 years. And there are strong correlations between gender inequalities and
  extreme poverty. For these reasons and more, Canada is pursuing a feminist 
  approach across all its international policies and programming, including 
  diplomacy, trade, security, and development.]",
  
  br(),br(),
  
  ## Indicators ----
  h3(style = "color:#00008b", "Objectives & Indicators"),
  
  ### Indicator 6.1 ----
  shinydashboard::box(width = 12,
                      collapsible = TRUE,
                      collapsed = TRUE,
                      title = "Feminist international approach to all policies and programs, including diplomacy, trade, security and development",
                      
                      #### Possible Indicators ----
                      "6.1 Increased and meaningful participation of women in peace and security efforts [TBD]", 
                      br(),br(),
                      "6.2 More women in leadership and decision-making roles, and stronger women's rights organizations [TBD]", 
                      br(),br(),
                      "6.3 More women and girls have access to sexual and reproductive health services and their rights are promoted [TBD]", 
                      br(),br(),
                      "6.4 More of Canada's trade agreements include gender related provisions [TBD]", 
                      br(),br(),
                      "6.5 More women have equitable access and control over the resources they need to build their own economic success and the economic success of their communities [TBD]", 
                      br(),br(),
                      "6.6 Fewer people are victims of sexual and gender-based violence and sexual exploitation, including in conflict settings and online [TBD]",
                      br(),br(),
                      "6.7 More girls and women access quality education and skills training [TBD]", 
                      br(),br(),
                     "Other Relevant B.C. Data: ",
                      tags$a("B.C. Population Projections Application", target = "_blank", href = "https://bcstats.shinyapps.io/popProjApp/"),
                      " (Access, customize and download sub-provincial population projection data by age and sex for various administrative areas)"
  )
  
 
  )



























