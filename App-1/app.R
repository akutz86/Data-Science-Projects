library(shiny)
library(datasets)
library(dplyr)
data(iris)


#Define UI ----
ui <- fluidPage (
  pageWithSidebar(
  titlePanel('Distribution of Length and Width of Petal and Sepal based on Species'),
  
  #Sidebar panel to allow user to show data by species
  sidebarPanel(
    selectInput('Species', 'Select Species', as.character(unique(iris$Species)))
  ),
  
  #main panel displays the 4 graphs for width and length of petal and sepal
  mainPanel(
    plotOutput('plot1',width = 800, height = 600)
  )
))
  
library(ggplot2)
library(gridExtra)

#Define server logic ----
server <- function(input,output) {
  
  data <- reactive({iris[iris$Species == input$Species,]})
  
  output$plot1 <- renderPlot({
    
    #Plot 1: Distribution of Sepal Length 
    g1 <- ggplot(data(), aes(Sepal.Length))
    g1 <- g1 + geom_histogram(binwidth = .5, fill="green", color = "black",alpha = .2)
    g1 <- g1 + geom_vline( aes(xintercept = mean(data()$Sepal.Length)), colour="red", size=2, alpha=.6)
    g1 <- g1 + labs(x = "Sepal Length")
    g1 <- g1 + labs(y = "Frequency")
    g1 <- g1 + labs(title = paste("Distribution of  Sepal Length, mu =", round(mean(data()$Sepal.Length),2)))
    
    #Dis of Sepal Width
    g2 <- ggplot(data(), aes(Sepal.Width))
    g2 <- g2 + geom_histogram(binwidth = .5, fill="green", color = "black",alpha = .2)
    g2 <- g2 + geom_vline( aes(xintercept = mean(data()$Sepal.Width)), colour="red", size=2, alpha=.6)
    g2 <- g2 + labs(x = "Sepal Width")
    g2 <- g2 + labs(y = "Frequency")
    g2 <- g2 + labs(title = paste("Distribution of Sepal Width, mu =", round(mean(data()$Sepal.Width),2)))
    
    #Dis of Petal Length
    g3 <- ggplot(data(), aes(Petal.Length))
    g3 <- g3 + geom_histogram(binwidth = .5, fill="yellow", color = "black",alpha = .2)
    g3 <- g3 + geom_vline( aes(xintercept = mean(data()$Petal.Length)), colour="red", size=2, alpha=.6)
    g3 <- g3 + labs(x = "Petal Length")
    g3 <- g3 + labs(y = "Frequency")
    g3 <- g3 + labs(title = paste("Distribution of  Petal Length, mu =", round(mean(data()$Petal.Length),2)))
    
    #Dis of Petal Width
    g4 <- ggplot(data(), aes(Petal.Width))
    g4 <- g4 + geom_histogram(binwidth = .5, fill="yellow", color = "black",alpha = .2)
    g4 <- g4 + geom_vline( aes(xintercept = mean(data()$Petal.Width)), colour="red", size=2, alpha=.6)
    g4 <- g4 + labs(x = "Petal Width")
    g4 <- g4 + labs(y = "Frequency")
    g4 <- g4 + labs(title = paste("Distribution of Petal Width, mu =", round(mean(data()$Petal.Width),2)))
    
    #Plotting 4 graphs
    grid.arrange(g1,g2,g3,g4,nrow=2, ncol=2)
    
  })

  
  
  
}

#Run the app
shinyApp(ui, server)