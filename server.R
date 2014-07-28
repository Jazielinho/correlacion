shinyServer(function(input, output){
      #Creando la función de gráfico
      data <- reactive({
            #Definiendo los valores de correlación
            #Definiendo el tamaño de muestra
            corr <- input$corr
            n <- input$n
            #Variable dependiente
            x <- seq(-1,1,by=2/(n-1))
            x <- (x-mean(x))/sd(x)
            #Variable independiente
            b1 <- corr
            y <- b1*x+rnorm(n,mean=0,sd=0.5)
            #Mostrando la gráfica y la linea de tendencia
            data <- data.frame(x,y)
            })
      
      #Mostrando el gráfico
      output$Plot <- renderPlot({
            grafico<-data()
            plot(grafico$x, grafico$y,
                 pch=19,
                 main="Gráfico de Dispersión",
                 xlab="X",
                 ylab="Y")
            abline(lm(y~x,data=grafico))
      })
      
      #Mostrando un resumen
      output$summary <- renderPrint({
            fit<-lm(y~x,data=data())
            summary(fit)
            })
      
      #Mostrando la data
      output$table <- renderTable({
            data.frame(data())
      })
            
      #Descargando la data
      output$downloadData <- downloadHandler(
            filename <- function(){
                  paste("correlacion","csv",sep=".")
            },
            content = function(file) {
                  sep <- ","
                  write.table(data(), file, sep = sep,
                              row.names = FALSE)
            }
      )
}
)
