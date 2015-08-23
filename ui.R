library(shiny)
library(datasets)

dataset <- data.frame(HairEyeColor)

shinyUI(pageWithSidebar(
        
        headerPanel("How normal are you?"),
        


        
        sidebarPanel(
                        h3("Statistic Student Explorer"),
                       h4("Number of Students"),
                       sliderInput('sampleSize', 'Sample Size', 
                                   min=5, max=16, value=10),
                       br(),

                       radioButtons("Sex", 
                                           label = h4("Choose your sex"), 
                                           choices = list("Male" = 'Male', 
                                                          "Female" = 'Female'),
                                           selected = 'Male'),

                       selectInput('Feature', 'Feature', choices = list("Hair" = 'Hair', "Eye Color" = 'Eye'),
                                   selected = 'Hair') 
                          
                ),
        
        mainPanel( h6("You can adapt the chart by using the tools in the grey sidepanel box. Give it a try!"),
                h3(textOutput("caption")),
                   plotOutput("MyPlot"))
))