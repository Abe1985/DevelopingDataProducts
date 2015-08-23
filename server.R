library(shiny)
library(reshape2)
library(datasets)

dataset <- data.frame(HairEyeColor)
x <- split(dataset, dataset$Sex)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should re-execute automatically
        #     when inputs change
        #  2) Its output type is a plot
        
        formulaText <- reactive({
                paste("Number of Statistic Students by ", input$Feature, " Color")
        })
        
        # Return the formula text for printing as a caption
        output$caption <- renderText({
                formulaText()
        })
        
        data <- reactive({
                if (input$Sex == 'Male')
                x$Male[sample(nrow(x$Male), input$sampleSize),]
                 else
                x$Female[sample(nrow(x$Female), input$sampleSize),]

                })
        
        data <- reactive({
                if (input$Sex == 'Male')
                        x$Male[sample(nrow(x$Male), input$sampleSize),]
                else
                        x$Female[sample(nrow(x$Female), input$sampleSize),]
                
        })
        
        ttext <- reactive({paste("Freq ~ ", input$Feature)})
        

        output$MyPlot <- renderPlot(
                
        
                barplot(aggregate(as.formula(ttext()), data(), FUN = sum)[,2], names.arg=aggregate(as.formula(ttext()), data(), FUN = sum)[,1], col = 'dark green')
        )
        
})
