
library(shinydashboard)
library(DT)

header = dashboardHeader(title = "Movies explorer")

sidebar = dashboardSidebar(
  textInput("title", "Title"),
  selectInput("genre", "Which genre?", 
              c("Action", "Animation", "Comedy", "Drama", 
                "Documentary", "Romance", "Short"))
)

body = dashboardBody(
  fluidRow(
    box(
      title = "Table", status = "success", width = 8, solidHeader = TRUE,
      DT::dataTableOutput("moviePicker")
    ),
    box(
      title = "More info", background = "olive", width = 4, collapsible = TRUE,
      uiOutput("listMovies")
    )
  ),
  
  fluidRow(
    tabBox(width = 5, title = "Graphs",
      tabPanel("LOESS", plotOutput("budgetYear")),
      tabPanel("Linear", plotOutput("budgetYearLinear"))
    ),
    box(
      title = "Title 2", width = 4, 
      sliderInput("year", "Year", min = 1893, max = 2005,
                  value = c(1945, 2005), sep = "")
    ),
    box(
      width = 3, status = "info", 
      checkboxGroupInput("checkbox", "Choose your...", 
                         choices = c("Own adventure", 
                                     "Weapon", 
                                     "Next words wisely"))
    )
  )
)

dashboardPage(header, sidebar, body)
