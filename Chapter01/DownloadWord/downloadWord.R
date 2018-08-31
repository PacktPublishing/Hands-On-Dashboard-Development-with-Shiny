library(rmarkdown)

function(input, output){
  
  output$downloadWordReport =
    downloadHandler(filename = "report.docx",
                    content = function(file){
                      
                      render("report.Rmd", output_format = "word_document",
                             output_file = file,
                             quiet = TRUE)
                    })
}