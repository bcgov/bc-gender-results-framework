
## Dev version of ggplot2:
# install.packages("devtools")
# devtools::install_github("tidyverse/ggplot2")

## load libraries  ----
library(tidyverse)
library(shiny)
library(rsconnect)
library(plotly)
library(lubridate)
library(janitor)
library(cansim)
library(shinyWidgets)
library(shinydashboard)
library(qs)

## data ----
cansim_data <<- qread("data/data.qs")

## chart theme/charts ----
source("scripts/chart_theme.R")
source("scripts/charts.R")


# UI demonstrating column layouts
ui <- function(req) {
  fluidPage(useShinydashboard(),
    title = "Gender Results Framework - B.C. Data",
  theme = "bootstrap.css",
  HTML("<html lang='en'>"),
  
  ## formatting for navlist menu
  tags$style(HTML('.col-sm-2.well {max-height: 90vh} ')),
  
  fluidRow(
    column(width = 12,
           style = "background-color:#003366; border-bottom:2px solid #fcba19;position:fixed;z-index:10000",
           tags$header(class="header", style="padding:0 0px 0 0px; display:flex; height:80px;
           width:100%;",
             tags$div(class="banner", style="display:flex; justify-content:flex-start; align-items:center; margin: 0 10px 0 10px",
               a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/data/about-data-management/bc-stats",
                 img(src = "bcstats_logo_rev.png", title = "BC Stats", height = "80px", alt = "BC Stats"),
                 onclick="gtag"
               ),
               h1("Gender Results Framework - Available B.C. Data", style="font-weight:400; color:white; margin: 5px 5px 0 18px;")
             )
           )
    ),
    ## Make changes to this column
    column(width = 12,
           style = "margin-top:100px",
           sidebarLayout(
             
             ## Sidebar Panel ----
             sidebarPanel(width = 2,
                          style = "margin-top:50px",
                          tags$fieldset("This site presents B.C. data, where available, to align with the federal government's",
                                        tags$a(target = "_blank", 
                                               href = 'https://women-gender-equality.canada.ca/en/gender-results-framework/poster-en.pdf', 
                                               "Gender Results Framework."),
                                        "More data sources will be added as they become available.",
                                        br(), br(),
                                        "Concepts and images sourced from the Government of Canada.",
                                        br(),br(),
                                        "Questions?",
                                        br(),br(),
                                        "Contact:",
                                        br(),br(),
                                        tags$a("Brooke Somers", href = 'mailto:Brooke.Somers@gov.bc.ca?Subject=gender-results-framework'),
                                        br(), 
                                        "BC Stats",
                                        br(),
                                        "T: 250-387-8811",
                                        br(), br(),
                                        tags$a("Stephanie Yurchak", href = 'mailto:Stephanie.Yurchak@gov.bc.ca?Subject=gender-results-framework'),
                                        br(), 
                                        "BC Stats",
                                        br(),
                                        "T: 250-480-8735",
                                        br(), br())),
           
           ## Main Panel ----
           mainPanel(width = 10,
                     tabsetPanel(id="tabs",
                                 type = "pills",
                       tabPanel(value = "Home",
                                        title = "Home",
                                width = 12,
                                        tags$fieldset(
                                          style = "margin-top:20px;",
                                          HTML("The Government of Canada's "),
                                          tags$a("Gender Results Framework", target = "_blank", href="https://women-gender-equality.canada.ca/en/gender-results-framework.html"),
                                          HTML(" represents Canada's vision for gender equality, highlighting the key issues that matter most.
                                               Under this framework, the federal government has identified six key areas where change is required to advance gender equality."),
                                          br(), br(),
                                          HTML("Explore these areas (below) to see data available for B.C. that align with the Government of Canada's goals. Each area-related tab presents the indicators
                                               identified by the Government of Canada. On each tab, expand the indicator of choice by clicking the + symbol to find information, charts and clickable links 
                                               to B.C. data. To explore links from a variety of areas, see the All links on one page tab (above)."),
                                          br(), br(),
                                          HTML("The available B.C. data spans many years and while some of the data may only be from previous years this is the current data available."),
                                          br(),br(),
                                          HTML("Note that this site is in continuous development, and additional data will be added as it becomes available."),
                                          br(), br()),
                                        fluidRow(#div(style = "width: 80%; margin:0 auto",
                                          div(style = "width: 65%",
                                          column(width = 4,
                                                 tags$button(
                                                   id = "ed_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "education.png",
                                                            style= "width: 100%")
                                                   ),
                                                 br(), br(),
                                                 tags$button(
                                                   id = "just_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "justice.png",
                                                            style = "width: 100%")
                                                   )),
                                          column(width = 4,
                                                 tags$button(
                                                   id = "econ_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "economic.png",
                                                            style = "width: 100%")
                                                   ),
                                                 br(), br(),
                                                 tags$button(
                                                   id = "pov_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "poverty.png",
                                                            style = "width: 100%")
                                                   )),
                                          column(width = 4,
                                                 tags$button(
                                                   id = "lead_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "leadership.png",
                                                            style = "width: 100%")
                                                   ),
                                                 br(), br(),
                                                 tags$button(
                                                   id = "world_button",
                                                   class = "btn action-button",
                                                   style = "width: 100%",
                                                   tags$img(src = "world.png",
                                                            style = "width: 100%")
                                                   )))),
                                 br(),br()
                                        ),
                       tabPanel(value = "ed",
                                title = "Education",
                                width = 12,
                                source("scripts/tabs/tabs_ed.R")$value
                                ),
                       tabPanel(value = "econ",
                                title = "Economics",
                                width = 12,
                                source("scripts/tabs/tabs_econ.R")$value
                                ),
                       tabPanel(value = "lead",
                                title = "Leadership",
                                width = 12,
                                source("scripts/tabs/tabs_lead.R")$value
                                ),
                       tabPanel(value = "just",
                                title = "Access to justice",
                                width = 12,
                                source("scripts/tabs/tabs_just.R")$value
                                ),
                       tabPanel(value = "pov",
                                title = "Porverty reduction",
                                width = 12,
                                source("scripts/tabs/tabs_pov.R")$value
                                ),
                       tabPanel(value = "world",
                                title = "Equality around the world",
                                width = 12,
                                source("scripts/tabs/tabs_world.R")$value
                                ),
                       tabPanel(value = "links",
                                title = "All links on one page",
                                width = 12,
                                source("scripts/tabs/links.R")$value
                                )
                       )
              )
    ), ## End of column to make changes to
    column(width = 12,
           style = "background-color:#003366; border-top:2px solid #fcba19;",
           tags$footer(class="footer",
              tags$div(class="container", style="display:flex; justify-content:center; flex-direction:column; text-align:center; height:46px;",
                tags$ul(style="display:flex; flex-direction:row; flex-wrap:wrap; margin:0; list-style:none; align-items:center; height:100%;",
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/home", "Home", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;")),
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/home/disclaimer", "Disclaimer", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;")),
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/home/privacy", "Privacy", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;")),
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/home/accessibility", "Accessibility", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;")),
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/gov/content/home/copyright", "Copyright", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;")),
                  tags$li(a(target = "_blank", href="https://www2.gov.bc.ca/StaticWebResources/static/gov3/html/contact-us.html", "Contact", style="font-size:1em; font-weight:normal; color:white; padding-left:5px; padding-right:5px; border-right:1px solid #4b5e7e;"))
                )
              )
             )
    )
  )
))
}

## Define server logic ----
server <- function(input, output, session) {
  
  observeEvent(input$ed_button, {
    updateTabsetPanel(session,
                      "tabs",
                      selected = "ed")
  })

  observeEvent(input$econ_button, {
    updateTabsetPanel(session,
                       "tabs",
                       selected = "econ")
  })

  observeEvent(input$lead_button, {
    updateTabsetPanel(session,
                       "tabs",
                       selected = "lead")
  })

  observeEvent(input$just_button, {
    updateTabsetPanel(session,
                       "tabs",
                       selected = "just")
  })

  observeEvent(input$pov_button, {
    updateTabsetPanel(session,
                       "tabs",
                       selected = "pov")
  })

  observeEvent(input$world_button, {
    updateTabsetPanel(session,
                       "tabs",
                       selected = "world")
  })

# Plots ----
  
  output$ed_1_1_1 <- renderPlot(chart_ed_1_1_1)
  output$ed_1_1_3 <- renderPlot(chart_ed_1_1_3)
  output$ed_1_3_1 <- renderPlot(chart_ed_1_3_1)
  output$econ_2_1_1 <- renderPlot(chart_econ_2_1_1)
  output$econ_2_2_1 <- renderPlot(chart_econ_2_2_1)
  output$econ_2_3_1 <- renderPlot(chart_econ_2_3_1)
  output$econ_2_4_1 <- renderPlot(chart_econ_2_4_1)
  output$econ_2_5_1 <- renderPlot(chart_econ_2_5_1)
  output$lead_3_1_1 <- renderPlot(chart_lead_3_1_1)
  output$lead_3_2_1 <- renderPlot(chart_lead_3_2_1)
  output$just_4_2_1 <- renderPlot(chart_just_4_2_1)
  output$just_4_3_1 <- renderPlot(chart_just_4_3_1)
  output$just_4_6_1 <- renderPlot(chart_just_4_6_1)
  output$pov_5_2_1 <- renderPlot(chart_pov_5_2_1)
  output$pov_5_3_1 <- renderPlot(chart_pov_5_3_1)
  output$pov_5_5_1 <- renderPlot(chart_pov_5_5_1)

 

}

## Knit together ui and server ----
shinyApp(ui = ui, server = server)
