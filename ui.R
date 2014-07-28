shinyUI(fluidPage(
      titlePanel("Analisis de correlacion"),
      br(),
      sidebarLayout(
            sidebarPanel(
                  p("Esta aplicacion muestra como varia el diagrama de dispersion, a medida que varia la correlacion entre las variables"),
                  p("El nivel de correlacion varia de -1 a 1"),
                  p("Cuando mas cercano este a los extremos, mas fuerte sera la relacion entre las variables."),
                  p("Elija entre los distintos niveles de correlacion y tamano de muestra."),
                  p("La aplicacion muestra el grafico de dispersion, su linea de tendencia, un pequeno resumen y la data si se desea descargar:"),
                  br(),
                  sliderInput("corr", 
                              "Correlacion:", 
                              value = 0,
                              min = -1, 
                              max = 1,
                              step=0.01),
                  br(),
                  sliderInput("n",
                              "Tamano de muestra:",
                              value = 100,
                              min = 10,
                              max = 1000),
                  br(),
                  downloadButton("downloadData", "Descargar data")
            ),
                  mainPanel(
                  tabsetPanel(type = "tabs",
                              tabPanel("Plot",plotOutput("Plot")),
                              tabPanel("Resumen",verbatimTextOutput("summary")),
                              tabPanel("Tabla", tableOutput("table"))
                              )
                  )
            )
      )
      )
