library(shiny)
library(shinydashboard)
library(dplyr)
library(plotly)
library(ggplot2)

starwars_data <- dplyr::starwars

function(input, output, session) {
  
  # Mettre à jour dynamiquement les choix pour le bar chart
  observe({
    updateSelectInput(session, "color_by",
                      choices = c("hair_color", "skin_color", "eye_color"),
                      selected = "hair_color")
  })
  
  # Données filtrées en fonction du slider
  filtered_data <- reactive({
    starwars_data %>%
      filter(!is.na(height), !is.na(mass)) %>%
      head(input$nb_indiv)
  })
  
  # ValueBoxes
  output$box1 <- renderValueBox({
    valueBox(42, "Box fixe", icon = icon("th"), color = "light-blue")
  })
  
  output$box2 <- renderValueBox({
    valueBox(nrow(starwars_data), "Individus", icon = icon("users"), color = "red")
  })
  
  output$box3 <- renderValueBox({
    valueBox(ncol(starwars_data), "Dimensions", icon = icon("columns"), color = "orange")
  })
  
  # Moyenne taille
  output$avg_height <- renderText({
    round(mean(filtered_data()$height, na.rm = TRUE), 1)
  })
  
  # Masse médiane
  output$med_mass <- renderText({
    median(filtered_data()$mass, na.rm = TRUE)
  })
  
  # SCATTER PLOT interactif
  output$scatterPlot <- renderPlotly({
    plot_ly(
      data = filtered_data(),
      x = ~height,
      y = ~mass,
      type = 'scatter',
      mode = 'markers',
      text = ~name,
      marker = list(size = 10, color = 'steelblue')
    ) %>%
      layout(
        title = "Taille vs Masse",
        xaxis = list(title = "Height (cm)"),
        yaxis = list(title = "Mass (kg)")
      )
  })
  
  # BAR CHART statique (distribution couleur)
  output$barChart <- renderPlot({
    req(input$color_by)
    starwars_data %>%
      filter(!is.na(.data[[input$color_by]])) %>%
      count(.data[[input$color_by]]) %>%
      ggplot(aes(x = reorder(.data[[input$color_by]], n), y = n, fill = .data[[input$color_by]])) +
      geom_col(show.legend = FALSE) +
      coord_flip() +
      labs(
        x = input$color_by,
        y = "Nombre",
        title = paste("Distribution de", input$color_by)
      ) +
      theme_minimal()
  })
}
