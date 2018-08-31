
fluidPage(
  
  titlePanel("Movies explorer"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Control panel"),
      sliderInput("year", "Year", min = 1893, max = 2005,
                  value = c(1945, 2005), sep = ""),
      textInput("title", "Title"),
      selectInput("genre", "Which genre?", 
                  c("Action", "Animation", "Comedy", "Drama", 
                    "Documentary", "Romance", "Short")),
      
      conditionalPanel(
        condition = "input.theTabs == 'table'",
        uiOutput("listMovies")
      )
    ),
    
    mainPanel(
      tabsetPanel(id = "theTabs",
                  tabPanel("Budgets over time", value = "plot", plotOutput("budgetYear")),
                  tabPanel("Movie picker", value = "table", tableOutput("moviePicker"))
      )
    )
  )
)
