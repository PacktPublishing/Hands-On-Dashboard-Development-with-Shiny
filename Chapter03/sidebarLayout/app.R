
ui = fluidPage(
  titlePanel("Example"),
  
  sidebarLayout(
    
    sidebarPanel(
      ("Inputs")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("User info", icon = icon("user", lib = "glyphicon")),
        tabPanel("Trend", icon = icon("calendar"))
      )
    )
  )
)

server = function(input, output){}

shinyApp(server = server, ui = ui)
  