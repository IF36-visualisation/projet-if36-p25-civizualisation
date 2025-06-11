library(shiny)
library(shinydashboard)
library(plotly)

dashboardPage(
  skin = "green",
  dashboardHeader(title = "Star Wars"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Stats", tabName = "stats", icon = icon("chart-bar")),
      menuItem("Graphiques", tabName = "graph", icon = icon("chart-pie"))
    ),
    sliderInput("nb_indiv", "Nb individus", min = 1, max = 100, value = 10),
    selectInput("color_by", "Color for distribution:", choices = NULL)
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "stats",
              fluidRow(
                valueBoxOutput("box1"),
                valueBoxOutput("box2"),
                valueBoxOutput("box3")
              ),
              fluidRow(
                box(
                  title = "AVERAGE HEIGHT (CM)", status = "primary", width = 6,
                  solidHeader = TRUE, h3(textOutput("avg_height"), align = "center")
                ),
                box(
                  title = "MEDIAN MASS (KG)", status = "primary", width = 6,
                  solidHeader = TRUE, h3(textOutput("med_mass"), align = "center")
                )
              )
      ),
      
      tabItem(tabName = "graph",
              fluidRow(
                box(
                  title = "Height and mass correlation", status = "primary", width = 6,
                  plotlyOutput("scatterPlot", height = "300px"),
                  align = "center"
                ),
                box(
                  title = "Distribution of color", status = "primary", width = 6,
                  plotOutput("barChart", height = "300px"),
                  align = "center"
                )
              )
      )
    )
  )
          )
          
