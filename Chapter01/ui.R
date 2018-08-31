
fluidPage(
  
  tags$head(
    tags$style(HTML("h3 {
                      color: blue;font-family:courier;
                      text-decoration: underline;
                    }"
    ))
  ),
  
  includeCSS("style.css"),
  
  titlePanel("Movies explorer"),
  
  sidebarLayout(
    sidebarPanel(
      h1("Control panel", 
         style = "color:red; font-family:Impact, Charcoal, sans-serif;"),
      sliderInput("year", "Year", min = 1893, max = 2005,
                  value = c(1945, 2005), sep = ""),
      textInput("title", "Title"),
      selectInput("genre", "Which genre?", 
                  c("Action", "Animation", "Comedy", "Drama", 
                    "Documentary", "Romance", "Short")),
      
      uiOutput("listMovies")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Budgets over time", plotOutput("budgetYear"),
                 p("For more information about ", strong("Shiny"), " look at the ",
                   a(href = "http://shiny.rstudio.com/articles/", 
                     "documentation.")),
                 hr(),
                 h3("Some code goes under here"),
                 p("If you wish to write some code you may like to use the pre() 
                   function like this:",
                   pre('sliderInput("year", "Year", min = 1893, max = 2005,
                   value = c(1945, 2005), sep = "")'))),
        tabPanel("Movie picker", tableOutput("moviePicker"))
      )
    )
  )
)
