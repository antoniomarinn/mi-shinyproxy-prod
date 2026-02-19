library(shiny)

# Interfaz de usuario
ui <- fluidPage(
  titlePanel("App de R en docker"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Número de barras:", min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Lógica del servidor
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'skyblue', border = 'white',
         main = "Histograma de Geiseres", xlab = "Tiempo de espera")
  })
}

# Lanzar la app
shinyApp(ui = ui, server = server)
