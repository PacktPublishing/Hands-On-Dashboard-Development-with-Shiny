
library(ggplot2movies)
library(tidyverse)
library(scales)
library(rlang)

function(input, output, session) {
  
  moviesSubset = reactive({
    
    movies %>% filter(year %in% seq(input$year[1], input$year[2]), 
                      UQ(sym(input$genre)) == 1)
    
  })
  
  observe({
    
    if(input$year[2] - input$year[1] <= 10){
      
      showModal(modalDialog(
        title = "Error!",
        "Please select a longer time period", hr(), "Resetting the control..."
      ))
      
      updateSliderInput(session, "year", value = c(1945, 2005))
    }
  })
  
  output$budgetYear = renderPlot({
    
    budgetByYear = summarise(group_by(moviesSubset(), year), 
                             m = mean(budget, na.rm = TRUE))
    
    ggplot(budgetByYear[complete.cases(budgetByYear), ], 
           aes(x = year, y = m)) + 
      geom_line() + 
      scale_y_continuous(labels = scales::comma) + 
      geom_smooth(method = "loess") + 
      ggtitle(input$title)
    
  })
  
  output$listMovies = renderUI({
    
    selectInput("pickMovie", "Pick a movie", 
                choices = moviesSubset() %>% 
                  sample_n(10) %>%
                  select(title)
    )
  })
  
  output$moviePicker = renderTable({
    
    filter(moviesSubset(), title == input$pickMovie)
    
  })
  
}
