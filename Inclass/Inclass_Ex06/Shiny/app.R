pacman::p_load(tidyverse, shiny)

exam <- read_csv("data/Exam_data.csv")

ui <- fluidPage(
  titlePanel("Pupils Examination Result Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "variables",
                  label = "Subject:",
                  choices = c("English"= "ENGLISH",
                              "Maths" = "MATHS",
                              "Science" = "SCIENCE"),
                  selected = "ENGLISH"),
      sliderInput(inputId = "bins",
                  label = "NUmber of bins",
                  min = 5,
                  max = 20,
                  value = 10)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output){
  output$distPlot <- renderPlot({
    ggplot(data = exam, 
           aes_string(x = input$variables)) + 
      geom_histogram(bins = input$bins,
                     color="black", 
                     fill="light blue")
  })
}

shinyApp(ui = ui, server = server)
