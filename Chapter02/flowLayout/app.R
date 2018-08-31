
server = function(input, output){
  
  # server code
}

ui = fluidPage(
  
  fluidRow(
    column(2, wellPanel(p("Column width 2"))),
    column(10, wellPanel(p("Column width 10")))),
  fluidRow(
    column(2, wellPanel(p("Column width 2"))),
    column(10, wellPanel(p("Column width 10")),
           fluidRow(
             column(6, wellPanel(p("Column width 6"))),
             column(6, wellPanel(p("Column width 6")))
           )
    )
  )
)

shinyApp(ui = ui, server = server)

