
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
    column(width = 4,
           box("LOESS", plotOutput("budgetYear"), width = "100%")
    ),
    column(width = 4,
           box("Linear", plotOutput("budgetYearLinear"), width = "100%")
    ),
    column(width = 4,
           box(width = 12,
             sliderInput("year", "Year", min = 1893, max = 2005,
                         value = c(1945, 2005), sep = "")),
           box(width = 12,
             checkboxGroupInput("checkbox", "Choose your...", 
                                choices = c("Own adventure", 
                                            "Weapon", 
                                            "Next words wisely"))
           )
    )
  )
)

dashboardPage(header, sidebar, body)
