library(dplyr)

data_kickstarter <- read.csv("../data/ks-projects-201801.csv") %>%
  na.omit()

function(input, output, session) {
  data_kickstarter_filtered <- reactive({
    data_kickstarter %>%
      filter(state %in% input$project_status)
  })

  # Overview
  output$nb_projects <- renderValueBox({
    valueBox(
      value = format(nrow(data_kickstarter_filtered()), big.mark = " ", scientific = FALSE),
      subtitle = "Nombre de projets",
      icon = icon("list"),
      color = "blue",
    )
  })
  output$avg_goal <- renderValueBox({
    valueBox(
      value = paste0(format(round(mean(data_kickstarter_filtered()$usd_goal_real, na.rm = TRUE), 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Objectif moyen",
      icon = icon("bullseye"),
      color = "green",
    )
  })
  output$avg_pledged <- renderValueBox({
    valueBox(
      value = paste0(format(round(mean(data_kickstarter_filtered()$usd_pledged_real, na.rm = TRUE), 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Montant moyen récolté",
      icon = icon("dollar-sign"),
      color = "yellow",
    )
  })
  output$avg_backers <- renderValueBox({
    valueBox(
      value = format(round(mean(data_kickstarter_filtered()$backers, na.rm = TRUE), 0), big.mark = " ", scientific = FALSE),
      subtitle = "Backers moyens",
      icon = icon("users"),
      color = "purple",
    )
  })

  # Onglet Catégories
  output$main_category_ui <- renderUI({
    selectInput(
      inputId = "main_category",
      label = "Catégorie principale :",
      choices = c("Toutes", sort(unique(data_kickstarter_filtered()$main_category))),
    )
  })

  output$category_ui <- renderUI({
    categories <- c("Toutes", sort(unique(data_kickstarter_filtered()$category[data_kickstarter_filtered()$main_category == input$main_category])))
    selectInput(
      inputId = "category",
      label = "Sous-catégorie :",
      choices = categories
    )
  })

  filtered_data <- reactive({
    df <- data_kickstarter_filtered()
    if (!is.null(input$category) && input$category != "Toutes") {
      subset(df, main_category == input$main_category & category == input$category)
    } else if (!is.null(input$main_category) && input$main_category != "Toutes") {
      subset(df, main_category == input$main_category)
    } else {
      df
    }
  })

  output$category_title <- renderText({
    if (!is.null(input$category) && input$category != "Toutes") {
      paste("Projets dans la sous-catégorie :", input$category)
    } else if (!is.null(input$main_category) && input$main_category != "Toutes") {
      paste("Projets dans la catégorie :", input$main_category)
    } else {
      "Tous les projets"
    }
  })

  output$nb_projects_by_category <- renderValueBox({
    v <- nrow(filtered_data())
    valueBox(
      value = format(v, big.mark = " ", scientific = FALSE),
      subtitle = "Nombre de projets",
      icon = icon("th"),
      color = "blue",
    )
  })

  output$mean_goal <- renderValueBox({
    v <- mean(filtered_data()$usd_goal_real, na.rm = TRUE)
    valueBox(
      value = paste0(format(round(v, 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Objectif moyen",
      icon = icon("bullseye"),
      color = "green",
    )
  })

  output$max_goal <- renderValueBox({
    v <- max(filtered_data()$usd_goal_real, na.rm = TRUE)
    valueBox(
      value = paste0(format(round(v, 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Plus grand objectif",
      icon = icon("arrow-up"),
      color = "green",
    )
  })

  output$mean_pledged <- renderValueBox({
    v <- mean(filtered_data()$usd_pledged_real, na.rm = TRUE)
    valueBox(
      value = paste0(format(round(v, 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Montant moyen récolté",
      icon = icon("bullseye"),
      color = "yellow",
    )
  })

  output$max_pledged <- renderValueBox({
    v <- max(filtered_data()$usd_pledged_real, na.rm = TRUE)
    valueBox(
      value = paste0(format(round(v, 0), big.mark = " ", scientific = FALSE), " $"),
      subtitle = "Plus grand montant récolté",
      icon = icon("arrow-up"),
      color = "yellow",
    )
  })

  output$mean_backers <- renderValueBox({
    v <- mean(filtered_data()$backers, na.rm = TRUE)
    valueBox(
      value = format(round(v, 0), big.mark = " ", scientific = FALSE),
      subtitle = "Nombre moyen de backers",
      icon = icon("bullseye"),
      color = "purple",
    )
  })

  output$max_backers <- renderValueBox({
    v <- max(filtered_data()$backers, na.rm = TRUE)
    valueBox(
      value = format(v, big.mark = " ", scientific = FALSE),
      subtitle = "Plus grand nombre de backers",
      icon = icon("arrow-up"),
      color = "purple",
    )
  })

  output$category_plot1 <- renderPlot({
    hist_data <- hist(
      filtered_data()$usd_goal_real,
      breaks = 10,
      plot = FALSE
    )
    barplot(
      hist_data$counts,
      names.arg = format(round(hist_data$mids, 0), big.mark = " ", scientific = FALSE),
      main = "Objectifs",
      xlab = "USD",
      ylab = "Nombre de projets",
      col = "steelblue",
      las = 2
    )
  })
  output$category_plot2 <- renderPlot({
    hist_data <- hist(
      filtered_data()$usd_pledged_real,
      breaks = 10,
      plot = FALSE
    )
    barplot(
      hist_data$counts,
      names.arg = format(round(hist_data$mids, 0), big.mark = " ", scientific = FALSE),
      main = "Montants récoltés",
      xlab = "USD",
      ylab = "Nombre de projets",
      col = "forestgreen",
      las = 2
    )
  })
  output$category_plot3 <- renderPlot({
    hist_data <- hist(
      filtered_data()$backers,
      breaks = 10,
      plot = FALSE
    )
    barplot(
      hist_data$counts,
      names.arg = format(round(hist_data$mids, 0), big.mark = " ", scientific = FALSE),
      main = "Backers",
      xlab = "Nombre",
      ylab = "Nombre de projets",
      col = "orange",
      las = 2
    )
  })
}
