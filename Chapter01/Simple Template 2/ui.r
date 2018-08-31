htmlTemplate( 
  "template.html", 
  slider = sliderInput("year", "Year", min = 1893, max = 2005, 
                       value = c(1945, 2005), sep = ""), 
  text = textInput("title", "Title"), 
  thePlot = plotOutput("budgetYear"), 
  comboBox = selectInput("genre", "Which genre?",  
                       c("Action", "Animation", "Comedy", "Drama",  
                           "Documentary", "Romance", "Short")) 
) 