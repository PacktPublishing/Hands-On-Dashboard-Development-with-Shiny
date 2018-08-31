
library(shinydashboard)

header = dashboardHeader(title = "Movies explorer")

sidebar = dashboardSidebar(
  sliderInput("year", "Year", min = 1893, max = 2005,
              value = c(1945, 2005), sep = ""),
  textInput("title", "Title"),
  selectInput("genre", "Which genre?", 
              c("Action", "Animation", "Comedy", "Drama", 
                "Documentary", "Romance", "Short")),
  
  icon("linux", class = "fa-spin fa-3x"),

  sidebarMenu(
    menuItem("Graph", tabName = "graph", icon = icon("line-chart")),
    menuItem("Table", tabName = "table", icon = icon("list-alt", lib = "glyphicon"))
  )
)

body = dashboardBody(
  tabItems(
    tabItem(tabName = "graph",
            plotOutput("budgetYear")
    ),
    tabItem(tabName = "table",
            tableOutput("moviePicker"),
            uiOutput("listMovies")
    )
  )
)

dashboardPage(header, sidebar, body)
