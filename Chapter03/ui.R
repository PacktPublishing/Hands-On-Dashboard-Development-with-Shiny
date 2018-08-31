
library(shinydashboard)

header = dashboardHeader(title = "Movies explorer")

sidebar = dashboardSidebar(
  sliderInput("year", "Year", min = 1893, max = 2005,
              value = c(1945, 2005), sep = ""),
  textInput("title", "Title"),
  selectInput("genre", "Which genre?", 
              c("Action", "Animation", "Comedy", "Drama", 
                "Documentary", "Romance", "Short")),

  sidebarMenu(
    menuItem("Graph", tabName = "graph"),
    menuItem("Table", tabName = "table")
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
