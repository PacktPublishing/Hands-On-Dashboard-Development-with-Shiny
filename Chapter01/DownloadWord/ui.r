fluidPage( 
  titlePanel("Title the report") 
  textInput("title", "Title", value = "Your title here"), 
  hr(), 
  downloadButton("downloadwrodreport", "Download word report") 
) 