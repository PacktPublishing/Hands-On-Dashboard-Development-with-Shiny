
server = function(input, output){
  
  # server code
}

ui = fixedPage(
  
  fixedRow(
    column(2, wellPanel(p("Column width 2"))),
    column(8, wellPanel(p("Column width 8")), offset = 2))
)

shinyApp(ui = ui, server = server)

