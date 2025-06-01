library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Kickstarter Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Catégories", tabName = "categories", icon = icon("th")),
      menuItem("Statut des projets", tabName = "status", icon = icon("check-square"),
        checkboxGroupInput(
          "project_status",
          "Statut des projets à inclure :",
          choices = c("suspended", "canceled", "failed", "live", "successful"),
          selected = c("suspended", "canceled", "failed", "live", "successful"),
        )
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "overview",
        fluidRow(
          valueBoxOutput("nb_projects"),
          valueBoxOutput("avg_goal"),
          valueBoxOutput("avg_pledged"),
          valueBoxOutput("avg_backers")
        ),
      ),
      tabItem(tabName = "categories",
        fluidRow(
          box(
            uiOutput("main_category_ui"),
            uiOutput("category_ui"),
            width = 12
          )
        ),
        fluidRow(
          box(
            h3(textOutput("category_title")),
          ),
          valueBoxOutput("nb_projects_by_category"),
        ),
        fluidRow(
          valueBoxOutput("mean_goal"),
          valueBoxOutput("max_goal"),
        ),
        fluidRow(
          valueBoxOutput("mean_pledged"),
          valueBoxOutput("max_pledged"),
        ),
        fluidRow(
          valueBoxOutput("mean_backers"),
          valueBoxOutput("max_backers"),
        ),
        fluidRow(
          box(plotOutput("category_plot1"), width = 4),
          box(plotOutput("category_plot2"), width = 4),
          box(plotOutput("category_plot3"), width = 4)
        )
      )
    )
  )
)