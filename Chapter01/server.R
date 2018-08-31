
library(ggplot2movies)
library(tidyverse)
library(scales)

library(rlang)

function(input, output) {
  
  moviesSubset = reactive({
    
    movies %>% filter(UQ(sym(input$genre)) == 1)

  })n
  
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
    
    if(is.null(input$pickMovie)) return()
    
    filter(moviesSubset(), title == input$pickMovie)

  })
  
}
